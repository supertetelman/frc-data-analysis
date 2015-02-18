%This functions takes 1 input
%
%matches: A M x 9 matrix in the format match_num,team1_red, team2_red,
%team3_red, red_score, team1_blue, team2_blue, team3_blue, blue_score.
%Where team is the FRC team number (811)
%
%The output of this function will by a matrix mapping each team number to
%an opr
%@author Adam Tetelman, FRC Team 811 Mentor, 2/17/2015
function X = opr_calc(matches)
%pm (parsed_matches) team1, team2, team3, teamScore
%Sepearate red/blue scores into their own rows 
pm = [matches(:,2:5);matches(:,6:9)];
[q w] = size(pm);


%initialize X as team, opr
m = 10000;
X = zeros(m,2);
X(:,1) = 1:m;

%Create the matrix that says which match each team was present in
team_calc = zeros(q, m);%Each column corresponds to a FRC team

%iterate over the full match list and update the team_calc ... 
%to show which teams played when
for i=1:q
    for j=1:w-1
        team_calc(i,pm(i,j)) = 1;
    end
end

%Solve the matrix equation
X(:,2) = team_calc \ pm(:,4)); %TODO remove zeros
end
