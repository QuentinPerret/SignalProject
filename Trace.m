function [frame] = Trace(frame,pts2D)
%--- Trace sur la frame les segments entre les points de la structure 3D

dimFrame=size(frame);
dimPts=size(pts2D);
k=1;
matIndex=zeros(dimFrame(1),dimFrame(2));

for i=1:dimFrame(1)
    for j=1:dimFrame(2)
        matIndex(i,j)=j+i+(j-1)*dimFrame(1)-mod(1,dimFrame(1));
    end
end

%la liste de points 2D est déjà triée de façon à ce qu'il soit nécessaire
%de tracer un segment entre un point et son suivant
while k<dimPts(1)
     pt1=pts2D(k,:);
     pt2=pts2D(k+1,:);
     
     %On récupère les coordonnées de deux points consécutifs
     x=[pt1(1) pt2(1)];
     y=[pt1(2) pt2(2)]; 

     %Donne le nombre de pixels séparant les deux points
     nbPoints=max(abs(diff(x)),abs(diff(y)))+1;
     index1=round(linspace(y(1),y(2),nbPoints));
     index2=round(linspace(x(1),x(2),nbPoints));

     %Vérifie si nous sommes toujours dans l'image puis trace les segments
     if(max(index1)<=dimFrame(2)&&max(index2)<=dimFrame(1) && min(index1)>=1 && min(index2)>=1)
         for l=1:length(index1)
             index=matIndex(index2(l),index1(l));
             frame(index)=220;
             frame(index+dimFrame(1)*dimFrame(2))=20;
             frame(index+2*dimFrame(1)*dimFrame(2))=60;
         end
     end
     k=k+2;
end

