function [frame] = Tracer(frame,pts3D,hauteurGrille,largeurGrille)

for j=1:largeurGrille-1
    for i=1:hauteurGrille-2
        x1=pts3D(i,1);
        x2=pts3D(i+1,1);
        x3=pts3D(j*hauteurGrille+i,1);
        y1=pts3D(i,2);
        y2=pts3D(i+1,2);
        y3=pts3D(j*hauteurGrille+i,2);

        coefA=y2-y1/x2-x1;
        ordA=y1-x1*coefA;
        coefB=y3-y1/x3-x1;
        ordB=y1-x1*coefB;

        nA=max(abs(x2-x1),abs(y2-y1));

        if nA==abs(x2-x1)
            xA=round(linspace(x1,x2,nA));
            yA=round(coefA*xA+ordA);
        else
            yA=round(linspace(y1,y2,nA));
            xA=round((yA-ordA)/coefA);
        end

        nB=max(abs(x3-x1),abs(y3-y1));

        if nB==abs(x3-x1)
            xB=round(linspace(x1,x3,nB));
            yB=round(coefB*xB+ordB);
        else
            yB=round(linspace(y1,y3,nB));
            xB=round((yB-ordB)/coefB);
        end
        
        for k=1:nA
             frame(yA + (xA-1)*dimVid(1)) = 0; %Rouge
             frame(yA + (xA-1)*dimVid(1) + dimVid(1)*dimVid(2) ) = 100; % Vert
             frame(yA + (xA-1)*dimVid(1) + dimVid(1)*dimVid(2)*2 ) = 250; % Bleu
        end

        for k=1:nB
             frame(yB + (xB-1)*dimVid(1)) = 0; %Rouge
             frame(yB + (xB-1)*dimVid(1) + dimVid(1)*dimVid(2) ) = 100; % Vert
             frame(yB + (xB-1)*dimVid(1) + dimVid(1)*dimVid(2)*2 ) = 250; % Bleu
        end
    end
end
return;
end
   