function [P] = Projection3D (x1,y1,x2,y2,z2,nbpts) %on peut l'appeler projection mais pas homographie car c pas bijectif en 3D
   
    A = zeros(nbpts*2,11);
    
    
    for i = 1:nbpts
        A(i*2-1,:) = [x2(i) y2(i) z2(i) 1 0 0 0 0 (-x2(i)*x1(i)) (-x1(i)*y2(i)) (-x1(i)*z2(i))];
        A(i*2,:) = [0 0 0 0 x2(i) y2(i) z2(i) 1 (-x2(i)*y1(i)) (-y2(i)*y1(i)) (-y1(i)*z2(i))];
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