clear
close all

%% Récupération première image de la vidéo
video=VideoReader('Video_Sujet.mp4'); %ouverture vidéo
% Nombre d'images dans la vidéo
nbFrame=video.NumFrames; 
image1 = read(video, 1);

sigma1=3;
sigma2=5;
sigmaG=2;

%% Définition variable coins
%imshow(image1);
%[x,y] = ginput(1);
coinsPreviousFrame =  [686 413; 1339 238; 1426 580; 632 767; 1011 486; 992 435];%coinsImg1
coinsFrame = coinsPreviousFrame;


%% Image à remplacer
meme=imread('meme.jpg');
taille=size(meme);
x2 = [1 taille(2) taille(2) 1 ]';
y2 = [1 1 taille(1) taille(1) ]';
%Feuille en 3 dimensions 
P3D=[-taille(2)/2 -taille(1)/2 0; -taille(2)/2 taille(1)/2 0; taille(2)/2 taille(1)/2 0; taille(2)/2 -taille(1)/2 0; -3/16*taille(2) 0 1 ; 0 0 3/2];

%% Traitement de la vidéo

writerObj = VideoWriter('out.mp4');
 
for i = 1:nbFrame

    img = double(read(video, i));
    
    %--- Passage en couleurs indexées
    I=CouleurToGris(img);
    
    %--- Detecteur Harris
    HarrisFinal = HarrisMultiEchelle(sigma1, sigma2, sigmaG,I) ;
    
    %--- MAJ des coins
    tmp = coinsFrame;
    coinsFrame = detectCoin(HarrisFinal, coinsPreviousFrame, coinsFrame);
    coinsPreviousFrame = tmp;
    
    %--- VERIFICATION
    %VerifCoin(img, coinsFrame,writerObj);

    %% Homographie
    x1 = coinsFrame(:,1);
    y1 = coinsFrame(:,2);
    X = Homographie(x2,y2,x1,y1,4);
    
    %% Remplacement
    newim = Replace(img,meme,X);
    
    % VERIFICATION
    open(writerObj);

 
   
    %% Ajout  de la structure 3D

    %Projection 3D
    [x,y,z]=Igloo(25,i);
    pointsARelier=RecuperePoints(x,y,z,taille/2);
    P=Projection3D(x1,y1,P3D,6);

    %Ajout de la structure
    im=Replace3D(newim,pointsARelier,P,taille);
    %% Verif
    Verification(im, coinsFrame, 6, writerObj);
end
% Enregistrer la verif
close(writerObj);


