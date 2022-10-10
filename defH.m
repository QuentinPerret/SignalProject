function H = defH(X1,X2)
    tx = size(X1)(1); %Nombre de point homographie

    %Initialisation matrice A
    mat=zeros(2*tx,2*tx);
    for j=0:tx-1
        mat(2*j+1,1)=X1(1,j+1);
        mat(2*j+1,2)=X1(2,j+1);
        mat(2*j+1,3)=1;
        mat(2*j+1,4)=0;
        mat(2*j+1,5)=0;
        mat(2*j+1,6)=0;
        mat(2*j+1,7)=-X1(1,j+1)*X2(1,j+1);
        mat(2*j+1,8)=-X1(2,j+1)*X2(1,j+1);

        mat(2*j+2,1)=0;
        mat(2*j+2,2)=0;
        mat(2*j+2,3)=0;
        mat(2*j+2,4)=X1(1,j+1);
        mat(2*j+2,5)=X1(2,j+1);
        mat(2*j+2,6)=1;
        mat(2*j+2,7)=-X1(1,j+1)*X2(2,j+1);
        mat(2*j+2,8)=-X1(2,j+1)*X2(2,j+1);
    end

    %Initialisation de la matrice B
    B  = zeros(tx,1)
    for i = 0:tx-1
        B(2*i+1,1) = X2(1,i)
        B(2*i+2,1) = X2(2,i)

    resH=mat\B; %Réasolution de A*H = B
    tH=resH';
    H=[tH(1:3) ; tH(4:6);[tH(7:8),1]];
end