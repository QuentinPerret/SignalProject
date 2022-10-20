function [img] = remplacement(frame,Xvid)
    
    %Récupération des points de l'image à intégrer
    i=imread("meme.jpg");
    taille_im=size(i);
    taille_frame  = size(frame);
    x1=[0,0,taille_im(2),taille_im(2)];
    y1=[0,taille_im(1),taille_im(1),0];
    Xim  = [x1; y1];
    
    %Définition de la matrice d'homographie
    H=defH(Xvid,Xim);
    
    %Réalisation de l'homographie

    %creation d'une matrice position regroupant l'ensemble des positions
    %des pixels de la frame
    [x2,y2] = meshgrid(1:taille_frame(2),1:taille_frame(1));
    position = [x2(:)';y2(:)';x2(:)'*0+1];
    
    %calcul des coordonnées de sortie à l'aide de H
    NewPosHom = H*position;
    NewPos = [round(NewPosHom(1,:) ./ NewPosHom(3,:)) ; round(NewPosHom(2,:) ./ NewPosHom(3,:))];
end
