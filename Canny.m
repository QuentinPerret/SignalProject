function [Ix,Iy]=Canny(image,sigma) 
%--- Fonction qui renvoie les composantes x et y du gradient
[X,Y]=meshgrid(-ceil(sigma*3):ceil(sigma*3)); %On construit la grille pour de façon à avoir 99,7% de l'information
Hx=-X/(2*pi*sigma.^4).*exp(-(X.^2+Y.^2)/(2*sigma^2)); %dérivée de la gaussienne selon x
Hy=-Y/(2*pi*sigma.^4).*exp(-(X.^2+Y.^2)/(2*sigma^2)); %dérivée de la gaussienne selon y
Ix=conv2(image,Hx,'same'); %Gradient selon x
Iy=conv2(image,Hy,'same'); %Gradient selon y



