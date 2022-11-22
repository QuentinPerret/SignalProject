function [frame] = TraceBis(frame,pts3D)
dimFrame=size(frame);
dimPts=size(pts3D);
k=1;
while k<dimPts(1) %les points sont déjà classés dans pts3D donc on trace un segment deux à deux
    pt1=pts3D(k,:);
    pt2=pts3D(k+1,:);
    %Equation de droite
    if(pt2(1)~=pt1(1)&&pt1(2)~=pt2(2))
        a=(pt2(2)-pt1(2))/(pt2(1)-pt1(1));  %coeff directeur
        b=pt1(2)-pt1(1)*a; %ordonnée à l'origine
        nx = abs(pt1(1)-pt2(1)); %distance en x entre les points
        ny = abs(pt1(2)-pt2(2)); % distance en y entre les points
        if( nx >= ny )
            n = nx;
            x = round(linspace(pt1(1),pt2(1),n)); %création d'un vecteur de n points
            %compris entre a(1) et b(1) 
            y = round(x*a + b);
        else
            n = ny;
            y = round(linspace(pt1(2),pt2(2),n));
            x = round((y - b)/a);
        end
        %On trace les traits 
        for i=1:1
            if x(i)>0 && x(i)<dimFrame(2) && y(i)>0 && y(i)<dimFrame(1) 
                frame(y(i),x(i),1) = 220;
                frame(y(i),x(i),2) = 20;
                frame(y(i),x(i),3) = 60;
                if y(i)<dimFrame(1)
                    frame(y(i)+1,x(i),1) = 220;
                    frame(y(i)+1,x(i),2) = 20;
                    frame(y(i)+1,x(i),3) = 60;
                end
                if y(i)>1
                    frame(y(i)-1,x(i),1) = 220;
                    frame(y(i)-1,x(i),2) = 20;
                    frame(y(i)-1,x(i),3) = 60; 
                end
            end
        end
    end
    k=k+2; %+2 car on relie deux points ensemble
end
end
