function [pointsARelier] = RecuperePoints(x,y,z,taille)
%--- Classe les points de coordonnées x,y,z dans l'ordre prévu pour tracer
%--- les segments

% Initialisation des points à relier
pointsARelier=[x(1,1)*taille(2) y(1,1)*taille(1) z(1,1); x(1+1,1)*taille(2) y(1+1,1)*taille(1) z(1+1,1);x(1,1)*taille(2) y(1,1)*taille(1) z(1,1);x(1,1+1)*taille(2) y(1,1+1)*taille(1) z(1,1+1)];

% Boucle pour mettre deux points à relier a la suite dans la liste
for i=1:size(x,1)-1
    for j=1:size(x,2)-1
        pointsARelier=[pointsARelier;x(i,j)*taille(2) y(i,j)*taille(1) z(i,j); x(i+1,j)*taille(2) y(i+1,j)*taille(1) z(i+1,j)];
        pointsARelier=[pointsARelier;x(i,j)*taille(2) y(i,j)*taille(1) z(i,j) ; x(i,j+1)*taille(2) y(i,j+1)*taille(1) z(i,j+1)];
    end
end

% On laisse volontairement la dernière colonne non reliée pour faire la
% porte de l'igloo
end

