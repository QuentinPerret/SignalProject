function [frame] = TraceTer(frame,pts3D)
dimFrame=size(frame);
dimPts=size(pts3D);
k=1;
while k<dimPts(1)
     pt1=pts3D(k,:);
     pt2=pts3D(k+1,:);
     x=[pt1(1) pt2(1)];
     y=[pt1(2) pt2(2)];
     nbPoints=max(abs(diff(x)),abs(diff(y)))+1;
     index1=round(linspace(y(1),y(2),nbPoints));
     index2=round(linspace(x(1),x(2),nbPoints));
     if(max(index1)<=dimFrame(1)&&max(index2)<=dimFrame(2) && min(index1)>=1 && min(index2)>=1)
         index=sub2ind([dimFrame(1) dimFrame(2)],index1,index2);
         frame(index)=220;
         frame(index+dimFrame(1)*dimFrame(2))=20;
         frame(index+2*dimFrame(1)*dimFrame(2))=60;
     end
     k=k+2;
end

