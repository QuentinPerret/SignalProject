function [P] = Projection3D (x1,y1,P3D,nbpts) 
%--- Renvoie la projection 2D des points 3D de l'igloo

A = zeros(nbpts*2,11);
B = zeros(nbpts*2,11);

%Matrice reliant les coins de la feuille au repère choisi pour repérer les
%points 
for i = 1:nbpts
    A(i*2-1,:) = [P3D(i,1) P3D(i,2) P3D(i,3) 1 0 0 0 0 (-P3D(i,1)*x1(i)) (-x1(i)*P3D(i,2)) (-x1(i)*P3D(i,3))];
    A(i*2,:) = [0 0 0 0 P3D(i,1) P3D(i,2) P3D(i,3) 1 (-P3D(i,1)*y1(i)) (-P3D(i,2)*y1(i)) (-y1(i)*P3D(i,3))];
end

for i = 1:nbpts
    B(i*2-1) = x1(i);
    B(i*2) = y1(i);
end

%Matrice colonne contenant les composantes de la projection 3D->2D
P=A\B;

P = [
    P(1) P(2) P(3) P(4);
    P(5) P(6) P(7) P(8);
    P(9) P(10) P(11) 1;
    ];
end