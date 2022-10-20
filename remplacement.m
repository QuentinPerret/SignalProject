function [img] = remplacement(Xvid)
    
    %Récupération des points de l'image à intégrer
    i=imread("meme.jpg");
    taille_im=size(i,1:2);
    x1=[0,0,taille_im(2),taille_im(2)];
    y1=[0,taille_im(1),taille_im(1),0];
    Xim  = [[x1;]; [y1;];];
    
    %Définition de la matrice d'homographie
    new_H=defH(Xvid,Xim);
    
    %Réalisation de l'homographie
    taille_v = size(img);
    truc=calculetousPoints(taille_v,new_H);

end
