%This function takes a # of teams, matches, and max score
%and outputs a set of random matches with teams/scores and
%a matrix of teams, match_count, total_score, w/l/t, avg_score
%
%@author Adam Tetelman, FRC Team 811 Mentor, 2/17/2015
function [matches, team_scores, teams] = opr_sample(in_team_count, ...
    in_match_count, in_score_range)
team_count = in_team_count;
match_count = in_match_count;
score_range = in_score_range;

%team_count = 40;
%match_count = 40;
%score_range = 150;

teams = [ 1:team_count]';

team_scores = zeros(team_count, 7);%team, match_count, total_score, win, lose, tie, avg_score
team_scores(:,1) = teams(:,:);

%Create a match matrix match_count rows and 9 columns (6 teams + match number + 2
%scores)
matches = zeros(match_count,9)
%Randomly pick 3 teams per match
for i=1:match_count
    %TODO:Use a list and list contains instead of lots of || statements
    scoreR = randi(score_range)
    team1R = randi(team_count);
    team2R = randi(team_count);
    while team2R == team1R
        team2R = randi(team_count);
    end
    team3R = randi(team_count);
    while team3R == team1R || team3R == team2R
        team3R = randi(team_count);
    end

    scoreB = randi(score_range)
    team1B = randi(team_count);
    while team1B == team1R || team1B == team2R || team1B == team3R
        team1B = randi(team_count);
    end
    team2B = randi(team_count);
    while team2B == team1B || team2B == team2R || team2B == team2R ...
            || team2B == team3R
        team2B = randi(team_count);
    end
    team3B = randi(team_count);
    while team3B == team2B || team3B == team1B || team3B == team2R ...
            || team3B == team2R || team3B == team3R
        team3B = randi(team_count);
    end
    
    matches(i,:) = [i, team1R, team2R, team3R, scoreR, ...
        team1B, team2B, team3B, scoreB ];

    team_scores(team1R,2) = team_scores(team1R,2) + 1;
    team_scores(team2R,2) = team_scores(team2R,2) + 1;
    team_scores(team3R,2) = team_scores(team3R,2) + 1;
    team_scores(team1R,3) = team_scores(team1R,3) + scoreR;
    team_scores(team2R,3) = team_scores(team2R,3) + scoreR;
    team_scores(team3R,3) = team_scores(team3R,3) + scoreR;
    
    team_scores(team1B,2) = team_scores(team1B,2) + 1;
    team_scores(team2B,2) = team_scores(team2B,2) + 1;
    team_scores(team3B,2) = team_scores(team3B,2) + 1;
    team_scores(team1B,3) = team_scores(team1B,3) + scoreB;
    team_scores(team2B,3) = team_scores(team2B,3) + scoreB;
    team_scores(team3B,3) = team_scores(team3B,3) + scoreB;
    
    if scoreR > scoreB
        team_scores(team1R,4) = team_scores(team1R,4) + 1;
        team_scores(team2R,4) = team_scores(team2R,4) + 1;
        team_scores(team3R,4) = team_scores(team3R,4) + 1;
        team_scores(team1B,5) = team_scores(team1B,5) + 1;
        team_scores(team2B,5) = team_scores(team2B,5) + 1;
        team_scores(team3B,5) = team_scores(team3B,5) + 1;
    elseif scoreR < scoreB
        team_scores(team1R,5) = team_scores(team1R,5) + 1;
        team_scores(team2R,5) = team_scores(team2R,5) + 1;
        team_scores(team3R,5) = team_scores(team3R,5) + 1;
        team_scores(team1B,4) = team_scores(team1B,4) + 1;
        team_scores(team2B,4) = team_scores(team2B,4) + 1;
        team_scores(team3B,4) = team_scores(team3B,4) + 1;
    elseif scoreR == scoreB
        team_scores(team1R,6) = team_scores(team1R,6) + 1;
        team_scores(team2R,6) = team_scores(team2R,6) + 1;
        team_scores(team3R,6) = team_scores(team3R,6) + 1;
        team_scores(team1B,6) = team_scores(team1B,6) + 1;
        team_scores(team2B,6) = team_scores(team2B,6) + 1;
        team_scores(team3B,6) = team_scores(team3B,6) + 1;
    end
end

%Calculate the average score
for i=1:length(team_scores)
    team_scores(i,7) = round(team_scores(i,3)/team_scores(i,2));
end

end