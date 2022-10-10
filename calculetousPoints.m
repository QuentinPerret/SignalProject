function [newPosition] = calculetousPoints (taille_im, H)
    newPosition=zeros(taille_im(1),taille_im(2),2);
    for i=1:taille_im(1)
        for j=1:taille_im(2)
            X=[i,j,1];
            calculePoint=calcule1point(X,H);
            newPosition(i,j,:)=[calculePoint(1),calculePoint(2)]/calculePoint(3);
        end
    end
end
