clear
close all

%% Récupération première image de la vidéo
video=VideoReader('video.mp4'); %ouverture vidéo
% Nombre d'images dans la vidéo
nbFrame=video.NumFrames; 
image1 = read(video, 1);

%% Définition variable coins
coinsPreviousFrame = [1 1; 1 1; 1 1; 1 1];
coinsFrame = coinsPreviousFrame;

%% Image à remplacer
meme=imread('meme.jpg');
taille=size(meme);
x2 = [1 taille(2) taille(2) 1]';
y2 = [1 1 taille(1) taille(1)]';

%% Traitement de la vidéo

writerObj = VideoWriter('out.mp4');
 
for i = 1:nbFrame
    close all
    coinsPreviousFrame = coinsFrame;
    img = double(read(video, i));
    image1 = read(video, i);
    imshow(image1);
    [x,y]=ginput(4);
    % Toutes les abscisses
    x1=fix(x); 
    % Toutes les ordonées
    y1=fix(y);
    coinsFrame = [x1 ,y1];

    %% Homographie
    X = Homographie(x2,y2,x1,y1,4);
    
    %% Remplacement
    newim = Replace(img,meme,X);
    
    % VERIFICATION
    open(writerObj);
    Verification(newim, coinsFrame, 4, writerObj);
end
% Enregistrer la verif
close(writerObj);