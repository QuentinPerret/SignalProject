function [B] = calcule1point(A,H)
    B = A*H;
end

function new_H = defH(x1,y1,x2,y2)
    mat=zeros(8,8);
    for j=0:3
        mat(2*j+1,1)=x1(j+1);
        mat(2*j+1,2)=y1(j+1);
        mat(2*j+1,3)=1;
        mat(2*j+1,4)=0;
        mat(2*j+1,5)=0;
        mat(2*j+1,6)=0;
        mat(2*j+1,7)= -x1(j+1)*x2(j+1);
        mat(2*j+1,8)=-y1(j+1)*x2(j+1);
        mat(2*j+2,1)=0;
        mat(2*j+2,2)=0;
        mat(2*j+2,3)=0;
        mat(2*j+2,4)=x1(j+1);
        mat(2*j+2,5)=y1(j+1);
        mat(2*j+2,6)=1;
        mat(2*j+2,7)=-x1(j+1)*y2(j+1);
        mat(2*j+2,8)=-y1(j+1)*y2(j+1);
    end
    B=[x2(1);y2(1);x2(2);y2(2);x2(3);y2(3);x2(4);y2(4)];
    H=mat\B;
    tH=H';
    new_H=[tH(1:3) ; tH(4:6);[tH(7:8),1]];
end