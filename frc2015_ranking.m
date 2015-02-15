%This ranking is an attempt to predict how well a team is doing and how
%likely they are to be a top ranking team based off the matches they have
%been in, the points they have scored, and the reported capabilities of
%their robot, and the experience level of the team
%FRC Team 811, Nashua NH
%@author Adam Tetelman
% 2/15/2015
function ranking = frc2015_ranking(matches, robot, team)

%matches can contain the following information:
%noodles scored, containers scored, average level of container scored totes
%scored, land fill noodles scored, scoring zone noodles scored,
%coopertition points scored, yellow totes stacked in middle, average tote
%stack size, autonomous tote stack, autonomous tote move, autonomous robot
%move, win/lose/tie, total points, 

%robot can contain the following information:
%Maximum level of tote stack, maximum level of container stack, container
%noodle, drive train, drive over scoring platform, multiple autonomous
%modes, 

%team can contain the following information:
%rookie year, home location, competition location, team size, team growth
%size, team budget, other team mentor present.

%It's very possible that we could take all this information and break it
%down into two/three scores, one based purely on match results, mixed with
%physical limits of the robot. A second score could be based not only on
%match results but also the individual contributions of the robot (if this
%information is present and avaialble). A third calculation could take the
%first two into account and also take into consideration team histories,
%budget, previous competitions, etc.


ranking = 1;

end