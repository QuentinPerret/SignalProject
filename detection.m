video=VideoReader("Video_Sujet.mp4");
Image=CouleurToGris(read(video,1));

sigma1=5;
sigma2=3;
sigmaG=2;


%On ouvre un writer pour pouvoir suivre les coins
writerObj=VideoWriter('VideoAvecCoins.avi');
open(writerObj);


%Traitement des images
i=1;
while hasFrame(video)
    if i==1
        figure,imshow(Image);
        coinImage1=ginput(4);
        coinImage2=coinImage1;
        tmp=detectCoin(H,coinImage2,coinImage1);
        H=HarrisMultiEchelle(sigma1,sigma2,sigmaG,Image);
        VerifCoin(Image,tmp,writerObj);
    elseif i==2
        VerifCoin(Image,tmp,writerObj);
    else
        Imagei=CouleurToGris(read(video,i));
        H=HarrisMultiEchelle(sigma1,sigma2,sigmaG,Imagei);
        tmp=coinImage2;
        coinImage2=detectCoin(Imagei,coinImage2,coinImage1);
        coinImage1=tmp;
        VerifCoin(Imagei,coinImage2,writerObj);
    end
    i=i+1;
end
close(writerObj);




