
clear
close all

v=VideoReader("Video_Sujet.mp4");
frame=read(v,1);
imshow(frame)
[x,y]=ginput(4);
x2=fix(x);
y2=fix(y);
i=imread("meme.jpg");
taille_im=size(i,1:2);
x1=[0,0,taille_im(2),taille_im(2)];
y1=[0,taille_im(1),taille_im(1),0];


%truc=zeros(taille_im(1),taille_im(2));
%for k=1:taille_im(1)
 %   for l=1:taille_im(2)
  %      new_x=
   %     truc(k,l)=
