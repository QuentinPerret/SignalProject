function [newPosition] = calculetousPoints (taille_v, H)
    newPosition=zeros(taille_v(1),taille_v(2),3);
    for i=1:taille_v(1)
        for j=1:taille_v(2)
            X=[i,j,1];
            newPosition(i,j,:)=calcule1point(X,H);
        end
    end
end
