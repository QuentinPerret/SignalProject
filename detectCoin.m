function coins=detectCoin(detecteur, coinsImage1,coinsImage2)
coins=coinsImage2;
for i=1:size(coins,1)
    coins(i,:)=ValMaxHarris(detecteur,coinsImage2(i,:),coinsImage1(i,:));
end