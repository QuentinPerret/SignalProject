function [frame] = Replace(frame,img,H)
    
    dimVid = size(frame);
    dimIncr = size(img);
    %Réalisation de l'homographie

    %creation d'une matrice position regroupant l'ensemble des positions
    %des pixels de la frame
    [x2,y2] = meshgrid(1:dimVid(2),1:dimVid(1));
    Vect = [x2(:)'; y2(:)'; x2(:)'*0+1];
    
    %calcul des coordonnées de sortie à l'aide de H
    NewPosHom = H*Vect;
    x1 = round(NewPosHom(1,:) ./ NewPosHom(3,:)) ;
    y1 = round(NewPosHom(2,:) ./ NewPosHom(3,:));

    %on récupère les indices correspond à la zone de la feuille
    A = (x1>0).*(x1<dimIncr(2)).*(y1>0).*(y1<dimIncr(1)).*detectionMain(:)'';
    pos = find(A);
    x2 = x2(pos); 
    y2 = y2(pos);
    x1 = x1(pos);
    y1 = y1(pos);

    frame(y2 + (x2-1)*dimVid(1)) = img(y1 + (x1-1)*dimIncr(1)); %Rouge
    frame(y2 + (x2-1)*dimVid(1) + dimVid(1)*dimVid(2) ) = img(y1 + (x1-1)*dimIncr(1)+ dimIncr(1)*dimIncr(2) ); % Vert
    frame(y2 + (x2-1)*dimVid(1) + dimVid(1)*dimVid(2)*2 ) = img(y1 + (x1-1)*dimIncr(1)+ dimIncr(1)*dimIncr(2)*2 ); % Bleu

return ;
end
