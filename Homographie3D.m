function [H] = Homographie3D (x1,y1,x2,y2,z2,nbpts)
   
    A = zeros(nbpts*2,11);
    
    
    for i = 1:nbpts
        A(i*2-1,:) = [x2(i) y2(i) z2(i) 1 0 0 0 0 (-x2(i)*x1(i)) (-x1(i)*y2(i)) (-x1(i)*z2(i))];
        A(i*2,:) = [0 0 0 0 x2(i) y2(i) z2(i) 1 (-x2(i)*y1(i)) (-y2(i)*y1(i)) (-y1(i)*z2(i))];
    end
    
    for i = 1:nbpts
        B(i*2-1) = x1(i);
        B(i*2) = y1(i);
    end

    P=A\B;
    
    H = [
        P(1) P(2) P(3) P(4);
        P(5) P(6) P(7) P(8);
        P(9) P(10) P(11) 1;
        ];
end