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
x2 = [1 taille(2) taille(2) 1 , fix(taille(2)/2)]';
y2 = [1 1 taille(1) taille(1) fix(taille(1)/2)]';

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
    X = Homographie(x2,y2,x1,y1,5);
    
    %% Remplacement
    newim = Replace(img,meme,X);
    
    % VERIFICATION
    open(writerObj);

    %VerifCoin(img,coinsFrame,video);
    Verification(newim, coinsFrame, 6, writerObj);
    %%Ajout  de la structure 3D

    %Projection 3D
    [x,y,z]=Igloo(50,50);
    P=Projection3D(x1,y1,x,y,z,6);

    %Ajout de la structure
    Replace3D(newim,coordonnees,P,50,50);
end
% Enregistrer la verif
close(writerObj);

%% test 

Igloo(50,50);
