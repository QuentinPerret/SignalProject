function [detecteurMulti]=HarrisMultiEchelle(sigma1,sigma2,image)
detecteur1=Harris(sigma1,image);
detecteur2=Harris(sigma2,image);
detecteurMulti=min(detecteur1.*abs(detecteur2),abs(detecteur1).*detecteur2);