function [pointsARelier] = RecuperePoints(x,y,z,taille)
%RECUPEREPOINTS Summary of this function goes here
%   Detailed explanation goes here
if(x(1)<taille(1)&& y(1)<taille(2))
pointsARelier=[-x(1,1)*taille(2) -y(1,1)*taille(1) z(1,1); -x(1+1,1)*taille(2) -y(1+1,1)*taille(1) z(1+1,1);-x(1,1)*taille(2) -y(1,1)*taille(1) z(1,1);-x(1,1+1)*taille(2) -y(1,1+1)*taille(1) z(1,1+1)];

elseif(x(1)<taille(1)&&y(1)>taille(2))
pointsARelier=[-x(1,1)*taille(2) y(1,1)*taille(1) z(1,1); -x(1+1,1)*taille(2) y(1+1,1)*taille(1) z(1+1,1);-x(1,1)*taille(2) y(1,1)*taille(1) z(1,1);-x(1,1+1)*taille(2) y(1,1+1)*taille(1) z(1,1+1)];

elseif(x(1)>taille(1)&&y(1)<taille(2))
pointsARelier=[x(1,1)*taille(2) -y(1,1)*taille(1) z(1,1); x(1+1,1)*taille(2) -y(1+1,1)*taille(1) z(1+1,1);x(1,1)*taille(2) -y(1,1)*taille(1) z(1,1);x(1,1+1)*taille(2) -y(1,1+1)*taille(1) z(1,1+1)];
else
    pointsARelier=[x(1,1)*taille(2) y(1,1)*taille(1) z(1,1); x(1+1,1)*taille(2) y(1+1,1)*taille(1) z(1+1,1);x(1,1)*taille(2) y(1,1)*taille(1) z(1,1);x(1,1+1)*taille(2) y(1,1+1)*taille(1) z(1,1+1)];
end

for i=1:size(x,1)-1
    for j=1:size(x,2)-1
        if(x(1)<taille(1)&& y(1)<taille(2))
            pointsARelier=[pointsARelier;-x(i,j)*taille(2) -y(i,j)*taille(1) z(i,j); -x(i+1,j)*taille(2) -y(i+1,j)*taille(1) z(i+1,j)];
            pointsARelier=[pointsARelier;-x(i,j)*taille(2) -y(i,j)*taille(1) z(i,j) ; -x(i,j+1)*taille(2) -y(i,j+1)*taille(1) z(i,j+1)];
        elseif(x(1)<taille(1)&&y(1)>taille(2))
            pointsARelier=[pointsARelier;-x(i,j)*taille(2) y(i,j)*taille(1) z(i,j); -x(i+1,j)*taille(2) y(i+1,j)*taille(1) z(i+1,j)];
            pointsARelier=[pointsARelier;-x(i,j)*taille(2) y(i,j)*taille(1) z(i,j) ; -x(i,j+1)*taille(2) y(i,j+1)*taille(1) z(i,j+1)];
        elseif(x(1)>taille(1)&&y(1)<taille(2))
            pointsARelier=[pointsARelier;x(i,j)*taille(2) -y(i,j)*taille(1) z(i,j); x(i+1,j)*taille(2) -y(i+1,j)*taille(1) z(i+1,j)];
            pointsARelier=[pointsARelier;x(i,j)*taille(2) -y(i,j)*taille(1) z(i,j) ; x(i,j+1)*taille(2) -y(i,j+1)*taille(1) z(i,j+1)];
        else    
            pointsARelier=[pointsARelier;x(i,j)*taille(2) y(i,j)*taille(1) z(i,j); x(i+1,j)*taille(2) y(i+1,j)*taille(1) z(i+1,j)];
            pointsARelier=[pointsARelier;x(i,j)*taille(2) y(i,j)*taille(1) z(i,j) ; x(i,j+1)*taille(2) y(i,j+1)*taille(1) z(i,j+1)];   
        end
     end
end

end

