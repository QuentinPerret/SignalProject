function [detecteur]=Harris(sigma,Ix,Iy)
[X,Y]=meshgrid(-floor(sigma)*3+1,floor(sigma)*3+1);
G_sigmaC=exp(-(X*X+Y*Y)/2/sigma/sigma);

Cxx=conv2(Ix.*Ix,G_sigmaC,'same');
Cyy=conv2(Iy.*Iy,G_sigmaC,'same');
Cxy=conv2(Ix.*Iy,G_sigmaC,'same');
detecteur=Cxx.*Cyy-Cxy.*Cxy-0.05.*(Cxx+Cyy);
