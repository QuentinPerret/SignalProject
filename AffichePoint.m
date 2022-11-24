function [frame] = AffichePoint(frame,x,y,z,P)

 dimVid = size(frame);
 dimIgloo = size(x);
 [x,y] = meshgrid(1:dimVid(2),1:dimVid(1));
 Vect = [x(:)'; y(:)'; x(:)'*0+1];
 
end

