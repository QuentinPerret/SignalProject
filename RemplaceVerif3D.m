function [frame] = RemplaceVerif3D(frame,pointsARelier,P,writerObj,taille)
    %--- Renvoie l'image à laquelle on a ajouté la figure 3D
   
    
    pts2D = zeros(size(pointsARelier,1),2);

    for i=1:size(pointsARelier,1)
        %Définition coordonnée homogène du point i dans un plan 3D
        X1=[pointsARelier(i,1);pointsARelier(i,2);pointsARelier(i,3);1];
        
        %Projection du point dans le plan 2D
        X2=P*X1;

        %Paramètre utilisé pour passer des coordonnées homogènes à réelles
        s=X2(3);
        x2=round(X2(1)/s);
        y2=round(X2(2)/s);

        %On vérifie que les points ne sortent pas de la feuille
        if x2>0 && x2<size(frame,2) && y2>0 && y2<size(frame,1)
            pts2D(i,1)=x2-taille(1)/2; %L'ajout d'un scalaire permet de modifier l'emplacement du centre de l'igloo
            pts2D(i,2)=y2+3*taille(2)/5;
        end
    end

    frame=Trace(frame,pts2D);
    imshow (uint8(frame));

    % Ajout de l'image sur la vidéo
    frameNew = getframe(gcf) ;
    writeVideo(writerObj, frameNew);
end

