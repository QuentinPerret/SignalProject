function [Ix,Iy]=Canny(image,sigma) %normalement sigma=2
[X,Y]=meshgrid(floor(-sigma*3:sigma*3),ceil(-sigma*3:sigma*3)); %On construit la grille pour avoir l'intégralité de l'information (ou presque)
Hx=-X/(2*pi*sigma.^4).*exp(-(X.^2+Y.^2)/(2*sigma^2)); %dérivée de la gaussienne selon x
Hy=-Y/(2*pi*sigma.^4).*exp(-(X.^2+Y.^2)/(2*sigma^2));
Ix=conv2(image ,Hx,'same'); %Gradient selon x
Iy=conv2(image,Hy,'same');



