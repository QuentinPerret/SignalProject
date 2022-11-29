function [detecteurMulti]=HarrisMultiEchelle(sigma1,sigma2,sigmaG,image)
%--- Renvoie le détecteur de harris le plus adapté au traitement de l'image

detecteur1=Harris(sigma1,sigmaG,image);
detecteur2=Harris(sigma2,sigmaG,image);
detecteurMulti=min(detecteur1.*abs(detecteur2),abs(detecteur1).*detecteur2);