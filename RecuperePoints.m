function [pointsARelier] = RecuperePoints(projection2D)
%RECUPEREPOINTS Summary of this function goes here
%   Detailed explanation goes here
pointsARelier=[projection2D(0,0) projection2D(1,0)];
for i=1:size(projection2D,1)-1
    for j=1:size(projection2D,2)-1
        pointsARelier=[pointsARelier;projection2D(i,j) projection2D(i+1,j)];
        pointsARelier=[pointsARelier;projection2D(i,j) projection2D(i,j+1)];
    end
end

figure, hold on
for k=1:size(pointsARelier,1)
    plot(pointsARelier(k,1),pointsARelier(k,2));
end
hold off;

end

