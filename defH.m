function H = defH(X1,X2)
    tx = size(X1,2); %Nombre de point homographie

    %Initialisation matrice A
    mat=zeros(2*tx,8);
    for j=1:tx
        mat(2*j-1,:)= [X1(1,j) X1(2,j) 1 0 0 0 X1(1,j)*X2(1,j) -X1(2,j)*X2(1,j)];
        mat(2*j,:)= [0 0 0 X2(1,j) X2(2,j) 1 X1(1,j)*X2(2,j) -X1(2,j)*X2(2,j)]; 
    end

    %Initialisation de la matrice B
    B  = zeros(2*tx,1);
    for i = 1:tx
        B(2*i-1,1) = X2(1,i);
        B(2*i,1) = X2(2,i);
    end

    resH=mat\B; %Réasolution de A*H = B
    tH=resH';
    H=[tH(1:3) ; tH(4:6);[tH(7:8),1]]; %def de H en 3x3 
end