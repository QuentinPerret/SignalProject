function [i] = calculIntensite(x2,y2)
    alpha=x2(4)-x2(1);
    beta=y2(2)-y2(a);
    i=(1-alpha)*(1-beta) + (1-alpha)*beta+alpha*(1-beta)+alpha*beta;