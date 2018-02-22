clear;
clc;
M=csvread('gagliano\day0.csv',1,0);

for i=1:size(M,2),  M(:,i)=(M(:,i)-min(M(:,i)))/(max(M(:,i))-min(M(:,i)));
end

[Itrain,Ivalid,Itest]=dividerand(size(M,1),70,15,15);

Dtrain = M(Itrain,[3 7 9 11 14]);
Dvalid = M(Ivalid,[3 7 9 11 14]);
Dtest = M(Itest,[3 7 9 11 14]);


clear M Itrain Ivalid Itest i

anfisedit