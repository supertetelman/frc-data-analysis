%This functions takes 1 input
%
%matches: A M x 9 matrix in the format match_num,team1_red, team2_red,
%team3_red, team1_blue, team2_blue, team3_blue, red_score, blue_score.
%Where team is the FRC team number (811)
%
%The output of this function will by a matrix mapping each team number to
%an opr
%@author Adam Tetelman, FRC Team 811 Mentor, 2/17/2015

function X = opr_calc()

matches = dlmread("matches.txt")
%pm (parsed_matches) team1, team2, team3, teamScore
%Sepearate red/blue scores into their own rows 
pm = [matches(:,2:4) matches(:,8); matches(:,5:7) matches(:,9)];
[q w] = size(pm);


%initialize X as team, opr
m = 10000;
X = zeros(m,2);
X(:,1) = 1:m;

%Create the matrix that says which match each team was present in
team_calc = zeros(q, m);%Each column corresponds to a FRC team
dlmwrite("blah",pm)


%iterate over the full match list and update the team_calc ... 
%to show which teams played when
for i=1:q
    for j=1:w-1
disp("DEBUG")
disp(pm(i,j))
        team_calc(i,pm(i,j)) = 1;
disp(team_calc(i,pm(i,j)))
    end
end

%Solve the matrix equation
%There is a bug with this line, it is not calculating things correctly
X(:,2) = team_calc \ pm(:,4); %TODO remove zeros
dlmwrite("opr.txt",X)
dlmwrite("opr2.txt",X(:,2))
dlmwrite("team_calc.txt",team_calc)
dlmwrite("pm.txt",pm)
disp("DEBUG")
disp(w)
end
