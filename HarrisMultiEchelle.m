function [detecteurMulti]=HarrisMultiEchelle(sigma1,sigma2,sigmaG,image)
detecteur1=Harris(sigma1,sigmaG,image);
detecteur2=Harris(sigma2,sigmaG,image);
detecteurMulti=min(detecteur1.*abs(detecteur2),abs(detecteur1).*detecteur2);