function [H] = Homographie (x1,y1,x2,y2,nbpts)
   
    A = zeros(nbpts*2,8);
    
    
    for i = 1:nbpts
        A(i*2-1,:) = [x2(i) y2(i) 1 0 0 0 (-x2(i)*x1(i)) (-x1(i)*y2(i))];
        A(i*2,:) = [0 0 0 x2(i) y2(i) 1 (-x2(i)*y1(i)) (-y2(i)*y1(i))];        
    end
    
    B = [x1(1);y1(1);x1(2);y1(2);x1(3);y1(3);x1(4);y1(4)];
    
    X=A\B;
    
    H = [
        X(1) X(2) X(3);
        X(4) X(5) X(6);
        X(7) X(8) 1;
        ];
end