function [x,y,z] = Igloo(diametre,numeroFrame)
%--- Crée l'igloo et renvoie les coordonnées x,y,z et chaque point 

% Création de la grille
[X,Y]=meshgrid(1:2:diametre,1:2:diametre); %pas de 2 pour que le dessin soit plus clair visuellement

% Angles pour repérer les points en coordonnées sphériques
tetha=(X./diametre)*2*pi+numeroFrame/100*2*pi; %Ajout d'un angle dépendant du numéro de la frame pour que l'igloo tourne
alpha=(Y./diametre)*pi/2;

% Affectation 
x=diametre/2.*cos(tetha).*sin(alpha);
y=diametre/2.*sin(tetha).*sin(alpha)+diametre/2; %Ajout d'une composante pour orienter l'igloo afin de mieux le voir
z=diametre/2.*cos(alpha);
    for i=1:size(z,1)
        for j=1:size(z,2)
            z(i,j)=25-z(i,j); %Symétrie pour que l'igloo soit dans le bon sens
           
        end
    end
end

