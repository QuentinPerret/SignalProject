function [] = VerifCoin(image,coins,video)
% on affiche l'image 
imshow(image);
hold on;
% on affiche les coinns 
for i=1:size(coins,1)
    plot(coins(i,1),coins(i,2),'r+','MarkerSize',10,'LineWidth',1);
end
hold off

NouvelleFrame=getframe(gcf);
writeVideo(video,NouvelleFrame);