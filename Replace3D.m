function [frame] = Replace3D(frame,x,y,z,P,hauteurGrille,largeurGrille)
    
    %dimVid = size(frame);
    
    pts3D = zeros(hauteurGrille,largeurGrille);

    for i=1:hauteurGrille
        for j=1:largeurGrille
        X1=[x(i,j);y(i,j);z(i,j);1];
        X2=P*X1;
        s=X2(3);
        X2=round(X2./s);
        pts3D(i,j)=X2(1);
        pts3D(i,j)=X2(2);
        end
    end

    %frame=Tracer(frame,pts3D,hauteurGrille,largeurGrille);
    %faire appel à une fonction tracer(attention il faut mettre la
    %détection MAIN)

return ;
end