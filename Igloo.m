function [x,y,z] = Igloo(diametre)
%Fonction qui crée l'igloo et va dans la projection 3D->2D
[X,Y]=meshgrid(1:2:diametre,1:2:diametre);
tetha=(X./diametre)*2*pi;
alpha=(Y./diametre)*pi/2;
x=diametre/2.*cos(tetha).*sin(alpha)+diametre/2;
y=diametre/2.*sin(tetha).*sin(alpha)+diametre/2;
z=diametre/2.*cos(alpha);
%coordonnees=c(x,y,z);
%hold on
%plot3(x,y,z);
%plot3(x',y',z');
%hold off;

end

