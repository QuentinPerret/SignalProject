function pointsARelier = RecuperePoints(projection2D)
%RECUPEREPOINTS Summary of this function goes here
%   Detailed explanation goes here

pointsArelier=[projection2D(0,0) projection2D(1,0)];
for i=1:size(projection2D,1)-1
    for j=1:size(projection2D,2)-1
        pointsArelier=[pointsARelier;projection2D(i,j) projection2D(i+1,j)]
    end
end

end
