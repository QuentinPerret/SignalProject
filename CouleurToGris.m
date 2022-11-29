function I = CouleurToGris(image)
%--- Renvoie une image en niveau de gris 

R=image(:,:,1); % Niveau de rouge en tout pixel 
G=image(:,:,2); % Niveau de vert 
B=image(:,:,3); % Niveau de bleu 
% Luminance perçue
I=0.299*R+0.587*G+0.114*B;