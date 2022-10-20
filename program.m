clear
close all

%Récupération de points de la vidéo 
v=VideoReader("Video_Sujet.mp4");
frame=read(v,1);
imshow(frame)
[x,y]=ginput(4);
x2=fix(x); 
y2=fix(y);
Xvid  = [[x2';]; [y2';];];

remplacement(Xvid);