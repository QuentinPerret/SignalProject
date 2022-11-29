function [detecteur]=Harris(sigma,sigmaG,image)
%--- Renvoie le détecteur de Harris en tout point

[Ix,Iy]=Canny(image,sigmaG); %Gradient en x et y
[X,Y]=meshgrid(-ceil(sigma*3):ceil(sigma*3));

% Gaussienne
G_sigmaC=1/(2*pi*sigma^2)*exp(-(X.*X+Y.*Y)/(2*sigma*sigma));

% Covariances
Cxx=conv2(Ix.*Ix,G_sigmaC,'same');
Cyy=conv2(Iy.*Iy,G_sigmaC,'same');
Cxy=conv2(Ix.*Iy,G_sigmaC,'same');

% Détecteur
det=Cxx.*Cyy-(Cxy.*Cxy);
Tr=Cxx+Cyy;
k=0.05;
detecteur=det-k*Tr.^2;
