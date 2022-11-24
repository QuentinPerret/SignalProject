function [frame] = Replace3D(frame,pointsARelier,P)
    
    %dimVid = size(frame);
    
    pts3D = zeros(size(pointsARelier,1),2);

    for i=1:size(pointsARelier,1)
        X1=[pointsARelier(i,1);pointsARelier(i,2);pointsARelier(i,3);1];
        X2=P*X1;
        s=X2(3);
        x2=round(X2(1)/s);
        y2=round(X2(2)/s);
        if x2>0 && x2<size(frame,2) && y2>0 && y2<size(frame,1)
            pts3D(i,1)=x2;
            pts3D(i,2)=y2;
        end
    end

    frame=TraceTer(frame,pts3D);
    %faire appel à une fonction tracer(attention il faut mettre la
    %détection MAIN)

return ;
end