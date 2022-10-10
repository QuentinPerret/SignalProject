function [newPosition] = calculetousPoints (taille_im, H)
    newPosition=zeros(taille_im(1),taille_im(2),3);
    for i=1:taille_im(1)
        for j=1:taille_im(2)
            X=[i,j,1];
            newPosition(i,j,1:3)=calcule1point(X,H);
        end
    end
end
