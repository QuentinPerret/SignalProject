function [Ix,Iy,L]=Canny(image)
R=image(:,:,1); %on récupère les couleurs
G=image(:,:,2);
B=image(:,:,3);
L=(R+G+B)/3; %luminance => pour le niveau de gris
sigma=2; %récupéré dans le diapo sigma_G
[X,Y]=meshgrid(-floor(sigma)*3+1,floor(sigma)*3+1); %On construit la grille pour avoir l'intégralité de l'information (ou presque)
Hx=-X.*exp(-(X.^2+Y.^2)/(2*sigma^2)); %dérivée de la gaussienne selon x
Hy=-Y.*exp(-(X.^2+Y.^2)/(2*sigma^2));
Ix=conv2(L ,Hx,'same'); %Gradient selon x
Iy=conv2(L,Hy,'same');


