clear
close all

%% Récupération de la vidéo
video=VideoReader('Video_Sujet.mp4'); %ouverture vidéo
% Nombre d'images dans la vidéo
nbFrame=video.NumFrames; 
%--- Paramètres pour le detecteur de Harris
sigma1=3;
sigma2=5;
sigmaG=2;

%% Définition variable coins
coinsPreviousFrame =  [686 413; 1339 238; 1426 580; 632 767; 1011 486; 1024 400]; %Séléctionnés au préalable avec un ginput
coinsFrame = coinsPreviousFrame;

%% Image à remplacer
banquise=imread('pingu.jpg');
taille=size(banquise);
x2 = [1 taille(2) taille(2) 1 ]'; %Données pour réaliser l'homographie
y2 = [1 1 taille(1) taille(1) ]'; 
%Feuille en 3 dimensions repérée grâce à un repère dont le (0,0) est au
%centre de l'image
P3D=[-taille(2)/2 -taille(1)/2 0; -taille(2)/2 taille(1)/2 0; taille(2)/2 taille(1)/2 0; taille(2)/2 -taille(1)/2 0; -3/16*taille(2) 0 1 ; 0 0 3/2];

%% Traitement de la vidéo
%--- Objet permettant de créer la vidéo sortante frame par frame.
writerObj = VideoWriter('out.mp4'); 
 
for i = 1:nbFrame

    img = double(read(video, i));
    
    %--- Passage en couleurs indexées
    I=CouleurToGris(img);
    
    %--- Detecteur Harris
    HarrisFinal = HarrisMultiEchelle(sigma1, sigma2, sigmaG,I) ;
    
    %--- MAJ des coins
    tmp = coinsFrame;
    coinsFrame = DetectCoin(HarrisFinal, coinsPreviousFrame, coinsFrame);
    coinsPreviousFrame = tmp;

    %% Homographie
    x1 = coinsFrame(:,1);
    y1 = coinsFrame(:,2);
    X = Homographie(x2,y2,x1,y1,4);
    
    %% Remplacement
    newim = Replace(img,banquise,X);
    
    %--- VERIFICATION
    open(writerObj);

    %% Ajout  de la structure 3D

    %--- Projection 3D
    [x,y,z]=Igloo(25,i);
    pointsARelier=RecuperePoints(x,y,z,taille/2);
    P=Projection3D(x1,y1,P3D,6);

    %--- Ajout de la structure
    im=Replace3D(newim,pointsARelier,P,taille);
    %% Verif
    Verification(im, coinsFrame, 6, writerObj);
end
%--- Enregistrer la verif
close(writerObj);


