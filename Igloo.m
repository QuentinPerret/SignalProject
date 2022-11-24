function [x,y,z] = Igloo(diametre,numeroFrame)
%Fonction qui crée l'igloo et va dans la projection 3D->2D
[X,Y]=meshgrid(1:2:diametre,1:2:diametre);
tetha=(X./diametre)*2*pi+numeroFrame/100*2*pi;
alpha=(Y./diametre)*pi/2;
x=diametre/2.*cos(tetha).*sin(alpha)+diametre/2;
y=diametre/2.*sin(tetha).*sin(alpha)+diametre/2;
z=diametre/2.*cos(alpha);
for i=1:size(z,1)
    for j=1:size(z,2)
        z(i,j)=25-z(i,j);
        x(i,j)=25-x(i,j);
        y(i,j)=25-y(i,j);
    end
end
%coordonnees=c(x,y,z);
%hold on
%plot3(x,y,z);
%plot3(x',y',z');
%hold off;

end

