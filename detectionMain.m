function [M] = detectionMain(frame)
    R=frame(:,:,1);
    G=frame(:,:,2);
    B=frame(:,:,3);
    Y=0.299*R+0.587*G+0.114*B;
    Cr=0.713*(R-Y)+128;
    M=abs(double(Cr>129)-1);
end