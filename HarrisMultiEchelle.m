function [detecteurMulti]=HarrisMultiEchelle(detecteur1,detecteur2)
detecteurMulti=min(detecteur1.*abs(detecteur2),abs(detecteur1).*detecteur2);