
clear
close all

v=VideoReader("Video_Sujet.mp4");
frame=read(v,1);
imshow(frame)
[x,y]=ginput(4);
x1=fix(x);
y1=fix(y);
i=imread("meme.jpg");
taille_im=size(i,1:2);
x2=[0,0,taille_im(2),taille_im(2)];
y2=[0,taille_im(1),taille_im(1),0];
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