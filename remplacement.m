function [img] = remplacement(frame,H,i)

    taille_frame  = size(frame);

    %creation d'une matrice position regroupant l'ensemble des positions
    %des pixels de la frame
    [x2,y2] = meshgrid(1:taille_frame(2),1:taille_frame(1));
    position = [x2(:)';y2(:)';x2(:)'*0+1];
    
    %calcul des coordonnées de sortie à l'aide de H
    NewPosHom = H*position;
    NewPos = [round(NewPosHom(1,:) ./ NewPosHom(3,:)) ; round(NewPosHom(2,:) ./ NewPosHom(3,:))];
    calculIntensite(NewPos(1),NewPos(2),i)
end
