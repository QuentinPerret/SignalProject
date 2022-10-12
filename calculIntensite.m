function [imgModifie] = calculIntensite(x2,y2,imgAjout,imgModif) 
imgAjoute=imread(imgAjout);
imgModifie=imread(imgModif);
%délimite la zone à parcourir à partir des coins 
for i=x2(1):x2(2)
    for j=y2(1):y2(4) %à revoir car dépend de l'ordre de choix des points
        %on récupère les coordonnées des points correspondants dans l'image à ajouter à l'aide d'une homographie inverse
        [new_x,new_y]=%créer une fonction homographie?

        x_11=[floor(new_x),floor(new_y)];
        x_12=[floor(new_x)+1,floor(new_y)];
        x_21=[floor(new_x),floor(new_y)+1];
        x_22=[floor(new_x)+1,floor(new_y)+1];

        alpha=new_x-floor(new_x);
        beta=new_y-floor(new_y);

        imgModifie(i,j)=(1-alpha)*(1-beta)*imgAjoute(x_11)+(1-alpha)*beta*imgAjoute(x_21)+alpha*(1-beta)*imgAjoute(x_12)+alpha*beta*imgAjoute(x_22);
    end
end