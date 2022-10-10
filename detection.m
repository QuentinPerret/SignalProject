video=VideoReader("Video_Sujet.mp4");
DecouperVideo(video);
%% niveau de gris (peut être faut-il appliquer un filtre gaussien pour enlever le bruit)
image=double(imread('images\001.jpg'));
[Ix,Iy,L]=Canny(image);
G=(Ix.*Ix+Iy.*Iy).^0.5; %Norme
figure,imshow(G)
colormap(flipud(gray(256)))  %On a une image colorée en fonction de la norme du gradient

%% Detecteur de Harris
detecteur1=Harris(3,Ix,Iy);
detecteur2=Harris(5,Ix,Iy);
detectMulti=HarrisMultiEchelle(detecteur1,detecteur2);

%% Trajectographie Linéaire 