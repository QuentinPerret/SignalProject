function coins=DetectCoin(detecteur, coinsImage1,coinsImage2)
%--- Détecte la position des coins 

coins=coinsImage2; %Les coins sont initalisés pour être les mêmes que l'image précédente 
for i=1:size(coins,1)
    coins(i,:)=ValMaxHarris(detecteur,coinsImage1(i,:),coinsImage2(i,:));
end