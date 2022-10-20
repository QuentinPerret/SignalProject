function []=DetectTousCoins(detecteur,video)
Imagei=read(video,1);
ImageIGris=CouleurToGris(Imagei);
figure,imshow(ImageIGris);
coinsImage1=ginput(4);
coinsImage2=coinsImage1;
coini=detectCoin(detecteur,coinsImage1,coinsImage2);
VerifCoin(ImageIGris,coini,video);
i=2;
while hasFrame(video)  
    Imagei=read(video,i);
    ImageIGris=CouleurToGris(Imagei);
    coini=detectCoin(detecteur,coinsImage1,coinsImage2);
    VerifCoin(ImageIGris,coini,video);
    coinsImage1=coinsImage2;
    coinsImage2=coini;
    i=i+1;
end