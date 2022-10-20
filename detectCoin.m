function coins=detectCoin(detecteur, coinsImage1, coinsImage2)
coins=coinsImage2;
for i=1:size(coins,2)
    coins(i,:)=ValMaxHarris(detecteur,coinsImage1(i,:),coinsImage2(i,:));
end