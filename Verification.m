function [] = Verification(image, coins, N, videoAvecCoins)
    % Affichage de l'image
    
    imshow (uint8(image));
    hold on;
    % Affichage des coins
    for i = 1:N    
        %plot(coins(i,1) , coins(i,2), 'g+', 'MarkerSize', 10, 'LineWidth', 2);    
    end
    hold off;
    % Ajout de l'image sur la vidéo
    frameNew = getframe(gcf) ;
    writeVideo(videoAvecCoins, frameNew);
end