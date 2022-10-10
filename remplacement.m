
clear
close all

%Récupération de points de la vidéo 
v=VideoReader("Video_Sujet.mp4");
frame=read(v,1);
imshow(frame)
[x,y]=ginput(4);
x2=fix(x); 
y2=fix(y);

%Récupération des points de l'image à intégrer
i=imread("meme.jpg");
taille_im=size(i,1:2);
x1=[0,0,taille_im(2),taille_im(2)];
y1=[0,taille_im(1),taille_im(1),0];

%Définition de la matrice d'homographie
new_H=defH(x1,x2,y1,y2);

%Réalisation de l'homographie
truc=calculetousPoints(taille_im,new_H);
