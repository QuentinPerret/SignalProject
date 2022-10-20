function [img] = remplacement(frame,Xvid,taille_im,taille_frame,H)
    
    
    %Réalisation de l'homographie

    %creation d'une matrice position regroupant l'ensemble des positions
    %des pixels de la frame
    [x2,y2] = meshgrid(1:taille_frame(2),1:taille_frame(1));
    position = [x2(:)';y2(:)';x2(:)'*0+1];
    
    %calcul des coordonnées de sortie à l'aide de H
    NewPosHom = H*position;
    NewPos = [round(NewPosHom(1,:) ./ NewPosHom(3,:)) ; round(NewPosHom(2,:) ./ NewPosHom(3,:))];

    %on récupère les indices correspond à la zone de la feuille
    Fzone = (NewPos(1,:)>0).*(NewPos(1,:)<taille_im(2)).*(NewPos(2,:)>0).*(NewPos(2,:)<taille_frame(1));

    NewX = NewPos();

end
