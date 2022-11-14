video=VideoReader("Video_Sujet.mp4");
Image=CouleurToGris(read(video,1));

sigma1=3;
sigma2=5;
sigmaG=2;
nb=video.NumFrames;

%On ouvre un writer pour pouvoir suivre les coins
writerObj=VideoWriter('VideoAvecCoins.avi');
open(writerObj);
%figure,imshow(read(video,1));
%point=ginput(1);
coinsImg1 = [685 412; 630 766; 1430 583; 1339 241; 921 475; 1024 403; 1130 313];
coinsImg2 = coinsImg1;
%Feuille en 3 dimensions 
P=[0 0 0; 0 1 0; 1 1 0; 1 0 0; 3/8 1/2 0.2 ; 1/2 1/4 0.3];

for i = 1:nb
  
 img = double(read(video, i));
    
    %--- Passage en couleurs indexées
    I=CouleurToGris(img);
    
    %--- Detecteur Harris
    HarrisFinal = HarrisMultiEchelle(sigma1, sigma2, sigmaG,I) ;
    
    %--- MAJ des coins
    tmp = coinsImg2;
    coinsImg2 = detectCoin(HarrisFinal, coinsImg1, coinsImg2);
    coinsImg1 = tmp;
    
    %--- VERIFICATION
    VerifCoin(img, coinsImg2,writerObj);

end
close(writerObj);

%% 
minH=min(H);
maxH=max(H);
figure,imshow(H,[-50 50])
colorbar;
%%
[X,Y]=meshgrid(-ceil(sigma1*3):ceil(sigma1*3));

%%
%Traitement des images
%i=1;
%while hasFrame(video)
  %if i==1
     %   figure,imshow(Image);
      %  coinImage1=ginput(4);
       % coinImage2=coinImage1;
       % H=HarrisMultiEchelle(sigma1,sigma2,sigmaG,Image);
        %tmp=detectCoin(H,coinImage1,coinImage2);
        %VerifCoin(read(video,i),tmp,writerObj);
    %elseif i==2
     %   VerifCoin(read(video,i),tmp,writerObj);
    %else
     %   Imagei=CouleurToGris(read(video,i));
      %  H=HarrisMultiEchelle(sigma1,sigma2,sigmaG,Imagei);
        %imshow(H);
       % tmp=coinImage2;
        %coinImage2=detectCoin(Imagei,coinImage1,coinImage2);
        %coinImage1=tmp;
        %VerifCoin(read(video,i),coinImage2,writerObj);
    %end
    %i=i+1;}%


