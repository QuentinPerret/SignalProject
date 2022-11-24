function [frame] = RemplaceVerif3D(frame,pointsARelier,P)
    
    %dimVid = size(frame);
    
    pts2D = zeros(size(pointsARelier,1),2);

    for i=1:size(pointsARelier,1)
        X1=[pointsARelier(i,1);pointsARelier(i,2);pointsARelier(i,3);1];
        X2=P*X1;
        z=X2(3);
        x2=round(X2(1)/z);
        y2=round(X2(2)/z);
        if x2>0 && x2<size(frame,2) && y2>0 && y2<size(frame,1)
            pts2D(i,1)=x2;
            pts2D(i,2)=y2;
        end
    end

    imshow (uint8(frame));
    hold on;
    % Affichage des coins
    for i = 1:size(pts2D,1)   
        plot(pts2D(i,1) , pts2D(i,2), 'r+', 'MarkerSize', 2, 'LineWidth', 2);    
    end
    hold off;
    % Ajout de l'image sur la vidéo
    frameNew = getframe(gcf) ;
    writeVideo(videoAvecCoins, frameNew);
end

