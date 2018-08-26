function [] = AStar(OccupancyMap, GoalLocation, RobotLocation)
Open = [];
Closed = [];
[rows, cols] = size(OccupancyMap);

% closed array gets all the 1's
% closed array format is x y
% NOTE: Formatting array instead of building object or researching Matlab
% farther, but should update in with proper programming in future
closedCounter = 1;
openCounter = 1;
for i=1:rows
    for j=1:cols
        if(OccupancyMap(i,j) == 1)
            Closed(closedCounter,1)=i;
            Closed(closedCounter,2)=j;
            closedCounter=closedCounter+1;
        end
    end
end

heuristic = h(RobotLocation(1), RobotLocation(2), GoalLocation(1), GoalLocation(2));
% open array format is [x,y,parentx,parenty,f,g]
Open(openCounter,1) = RobotLocation(1);
Open(openCounter,2) = RobotLocation(2);
Open(openCounter,3) = RobotLocation(1);
Open(openCounter,4) = RobotLocation(2);
Open(openCounter,5) = heuristic;
Open(openCounter,6) = 0;
openCounter = openCounter + 1;
[rowSizeOpen, colSizeOpen] = size(Open);
while(rowSizeOpen > 0)
    f = 10000;
    temp = [];
    removeIdx = -1;
    disp(rowSizeOpen);
    for ridx=1:rowSizeOpen
        if Open(ridx,5) < f
            f = Open(ridx,5);
            temp = Open(ridx,1:6);
            removeIndex = ridx;
        end
    end
    Open(removeIndex,:) = [];
    % successors format is 1:[x,y,parentx,parenty,f,g]...
    successors = getSuccessors(temp(1), temp(2), temp(6), GoalLocation);
    for successorRow=1:8
        if (successors(successorRow,1) == GoalLocation(1))&(successors(successorRow,2)==GoalLocation(2))
            % list must be built already
            break;
        % compute f
        % if position in open and smaller f, skip
        % if a node
        end
    
    
    [rowSizeOpen, colSizeOpen] = size(Open);
end
