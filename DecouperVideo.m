function DecouperVideo(video)
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