function [x,y,z] = Igloo(diametre,hauteur)
%Fonction qui crée l'igloo et va dans la projection 3D->2D
[X,Y]=meshgrid(1:diametre,1:hauteur);
tetha=(X./diametre)*2*pi;
alpha=(Y./hauteur)*pi/2;
x=diametre/2*cos(tetha)*sin(alpha);
y=diametre/2*sin(tetha)*sin(alpha);
z=diametre/2*sin(aplha);

end

