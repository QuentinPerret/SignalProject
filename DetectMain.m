function [M] = DetectMain(frame)
%--- Détecte la main grâce à un seuil 

    R=frame(:,:,1);
    Y=CouleurToGris(frame);
    Cr=0.713*(R-Y)+128;
    M=abs(double(Cr>129)-1);
end