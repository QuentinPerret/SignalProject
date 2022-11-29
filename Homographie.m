function [H] = Homographie (x1,y1,x2,y2,nbpts)
%--- Renvoie la matrice homographique H
   
    A = zeros(nbpts*2,8);
    B = zeros(nbpts*2);
    
    for i = 1:nbpts
        A(i*2-1,:) = [x2(i) y2(i) 1 0 0 0 (-x2(i)*x1(i)) (-x1(i)*y2(i))];
        A(i*2,:) = [0 0 0 x2(i) y2(i) 1 (-x2(i)*y1(i)) (-y2(i)*y1(i))];        
    end
    
    for i = 1:nbpts
        B(i*2-1) = x1(i);
        B(i*2) = y1(i);
    end
    
    X=A\B;
    
    H = [
        X(1) X(2) X(3);
        X(4) X(5) X(6);
        X(7) X(8) 1;
        ];
end