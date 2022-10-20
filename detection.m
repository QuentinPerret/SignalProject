video=VideoReader("Video_Sujet.mp4");
Image=CouleurToGris(read(video,1));

sigma1=5;
sigma2=3;


%On récupère les 4premiers coins :


%Traitement des images
i=1;
while hasFrame(video)
    if i==1
        figure,imshow(Image);
        coinImage1=ginput(4);
        coinImage2=coinImage1;
        coinI=detectCoin(H,coinImage1,coinImage2);
    elseif i==2
        
    else
        Imagei=read(video,i);
        ImageiGris=CouleurToGris(Imagei);
        tmp=coinImage2;
    end
    

    %Harris
    H=HarrisMultiEchelle(sigma1,sigma2,Imagei);

    %Coins
    coinsI=detectCoin(H,coinImage1,coinImage2);
    i=i+1;
end


%%
writerObject=VideoWriter('Video_Sujetavi');
open(writerObject);
DetectTousCoins(detectMulti,writerObject);
close(writerObject);



