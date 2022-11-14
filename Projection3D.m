function [P] = Projection3D (x1,y1,P3D,nbpts) %on peut l'appeler projection mais pas homographie car c pas bijectif en 3D
   
    A = zeros(nbpts*2,11);
    B = zeros(nbpts*2,11);
    
    
    for i = 1:nbpts
        A(i*2-1,:) = [P3D(i,1) P3D(i,2) P3D(i,3) 1 0 0 0 0 (-P3D(i,1)*x1(i)) (-x1(i)*P3D(i,2)) (-x1(i)*P3D(i,3))];
        A(i*2,:) = [0 0 0 0 P3D(i,1) P3D(i,2) P3D(i,3) 1 (-P3D(i,1)*y1(i)) (-P3D(i,2)*y1(i)) (-y1(i)*P3D(i,3))];
    end
    
    for i = 1:nbpts
        B(i*2-1) = x1(i);
        B(i*2) = y1(i);
    end

    H=A\B;
    
    P = [
        H(1) H(2) H(3) H(4);
        H(5) H(6) H(7) H(8);
        H(9) H(10) H(11) 1;
        ];
end