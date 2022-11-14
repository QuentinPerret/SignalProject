function [frame] = Replace3D(frame,points,P,hauteurGrille,largeurGrille)
    
    dimVid = size(frame);
    dimPts = size(points);
    pts3D = zeros(dimPts(1),2);

    for i=1:dimPts(1)
        X1=[points(i,1);points(i,2);points(i,3);1];
        X2=P*X1;
        s=X2(3);
        X2=round(X2./s);
        pts3D(i,1)=X2(1);
        pts3D(i,2)=X2(2);
    end

    frame=Tracer(frame,pts3D,hauteurGrille,largeurGrille);
    %faire appel à une fonction tracer(attention il faut mettre la
    %détection MAIN)

return ;
end