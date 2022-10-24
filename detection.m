video=VideoReader("Video_Sujet.mp4");
Image=CouleurToGris(read(video,1));

sigma1=3;
sigma2=5;
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
        H=HarrisMultiEchelle(sigma1,sigma2,sigmaG,Image);
        tmp=detectCoin(H,coinImage1,coinImage2);
        VerifCoin(read(video,i),tmp,writerObj);
    elseif i==2
        VerifCoin(read(video,i),tmp,writerObj);
    else
        Imagei=CouleurToGris(read(video,i));
        H=HarrisMultiEchelle(sigma1,sigma2,sigmaG,Imagei);
        %imshow(H);
        tmp=coinImage2;
        coinImage2=detectCoin(Imagei,coinImage1,coinImage2);
        coinImage1=tmp;
        VerifCoin(read(video,i),coinImage2,writerObj);
    end
    i=i+1;
end
close(writerObj);

%% 
minH=min(H);
maxH=max(H);
figure,imshow(H,[-50 50])
colorbar;
%%
[X,Y]=meshgrid(-ceil(sigma1*3):ceil(sigma1*3));




