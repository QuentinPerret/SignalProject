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
figure,imshow(read(video,1));
coinsPreviousFrame=ginput(6);
%coinsPreviousFrame =  [685 412; 630 766; 1430 583; 1339 241; 921 475; 1024 403];%coinsImg1
coinsFrame = coinsPreviousFrame;

%% Image à remplacer
meme=imread('meme.jpg');
taille=size(meme);
x2 = [1 taille(2) taille(2) 1]';
y2 = [1 1 taille(1) taille(1)]';

%% Feuille en 3 dimensions 
P=[0 0 0; 0 1 0; 1 1 0; 1 0 0; 3/8 1/2 0.2 ; 11/20 7/16 0.3];

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
    Verification(newim, coinsFrame, size(coinsFrame,1), writerObj);
end
% Enregistrer la verif
close(writerObj);