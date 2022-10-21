function posMax = ValMaxHarris(detecteur, posAvant,posEncoreAvant)

W=37; %taille de la fenetre 


% Soit posCentre le centre de la fenêtre déterminée par la trajectoire du
% déplacement des deux points précédents
posCentre=floor((3.*posAvant - posEncoreAvant)./2);


% Recherche de la valeur maximale du detecteur de Harris dans cette
% fenêtre
maxHarris = detecteur(posCentre(1), posCentre(2));

for i=posCentre(1)-((W - 1)/2):posCentre(1)+((W-1)/2)
    for j=posCentre(2)-((W-1)/2):posCentre(2)+((W-1)/2)
        if maxHarris < detecteur(j,i)
            maxHarris = detecteur(j,i);
            posMax = [i j];
        end    
    end
end  