function posMax = ValMaxHarris(detecteur, pos1, pos2)

W=37; %taille de la fenetre 
posMax = pos2;


% Soit posCentre le centre de la fenêtre déterminée par la trajectoire du
% déplacement des deux points précédents
posCentre=floor((3.*pos2 - pos1)./2);


% Recherche de la valeur maximale du detecteur de Harris dans cette
% fenêtre
maxHarris = D(posCentre(2), posCentre(1));

for i=posCentre(1)-((W - 1)/2):posCentre(1)+((W-1)/2)
    for j=posCentre(2)-((W-1)/2):posCentre(2)+((W-1)/2)
        if maxHarris < detecteur(j,i)
            maxHarris = detecteur(j,i);
            posMax = [i j];
        end    
    end
end  