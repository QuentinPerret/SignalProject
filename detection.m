video=VideoReader("Video_Sujet.mp4");
nbFrames=video.numFrames;

%% Dossier des frames

%création d'un dossier pour stocker chaque image
workingDir="H://Cours//2A//C7//Traitement d'images//SignalProject";
mkdir(workingDir)
mkdir( workingDir,'images')
%boucle pour récupérer chaque image de la vidéo
i=1;
while hasFrame(video)
    img=readFrame(video);
    filename = [sprintf('%03d',i) '.jpg'];
    fullname = fullfile(workingDir,'images',filename);
    imwrite(img,fullname)    % Ecrit dans un format JPG 
    i = i+1;
end

%% niveau de gris
first_image=double(imread('images\001.jpg'));
R=first_image(:,:,1); %on récupère les couleurs
G=first_image(:,:,2);
B=first_image(:,:,3);
L=(R+G+B)/3; %luminance => pour le niveau de gris
figure,imshow(uint8(L));
sigma=2; %récupéré dans le diapo sigma_G
[X,Y]=meshgrid(-floor(sigma)*3+1,floor(sigma)*3+1); %On construit la grille pour avoir l'intégralité de l'information (ou presque)
Hx=-X.*exp(-(X.^2+Y.^2)/(2*sigma^2)); %dérivée de la gaussienne selon x
Hy=-Y.*exp(-(X.^2+Y.^2)/(2*sigma^2));
Gx=conv2(L,Hx,'same'); %Gradient selon x
Gy=conv2(L,Hy,'same');
G=(Gx.*Gx+Gy.*Gy).^0.5; %Norme
figure,imshow(G)
colormap(flipud(gray(256)))
