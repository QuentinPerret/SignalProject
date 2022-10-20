function [newIntensite] = calculIntensite(x2,y2,imgAjout) 
%délimite la zone à parcourir à partir des coins 
for i=x2(1):x2(4)
    for j=y2(1):y2(4) 

        x_11=[floor(new_x),floor(new_y)];
        x_12=[floor(new_x)+1,floor(new_y)];
        x_21=[floor(new_x),floor(new_y)+1];
        x_22=[floor(new_x)+1,floor(new_y)+1];

        alpha=new_x-floor(new_x);
        beta=new_y-floor(new_y);

        newIntensite(i,j)=(1-alpha)*(1-beta)*imgAjout(x_11)+(1-alpha)*beta*imgAjout(x_21)+alpha*(1-beta)*imgAjout(x_12)+alpha*beta*imgAjout(x_22);
    end
end