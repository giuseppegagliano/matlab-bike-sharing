clear;
clc;
M=csvread('gagliano\day0.csv',1,0);
[Itrain,null,Itest]=dividerand(size(M,1),70,0,30);

Ttrain = M(Itrain,14)';
Xtrain = M(Itrain,[3 4 5 7 9 11])';
Ttest = M(Itest,14)';
Xtest = M(Itest,[3 4 5 7 9 11])';
eg = 0.02;                  %   sum-squared error goal

% % DISTANCE BETWEEN ADJACENT INPUT VECTORS
% Dadj=zeros(size(Xtrain,2),1);
% for i=2:1:size(Xtrain,2)-1,    Dadj(i-1) = sum((Xtrain(:,i-1)-Xtrain(:,i)).^2).^0.5;
% end
% plot(Dadj);
% ylim([0 7])
% 
% % DISTANCE OF THE INPUT SPACE
% Dsp=reshape(tril(dist(Xtrain)),1,[]);
% plot(Dsp);
% 
% for sc=7:50:657,                             %   spread constant
%     net = newrb(Xtrain,Ttrain,eg,sc,200);
%     export_fig(gcf,strcat('gagliano\Part_I_12\day\sc',num2str(sc)));
%     dlmwrite('gagliano\Part_I_12\day\day2_rbf_mse.csv',[power(10,sc) mse(net,Ttest,net(Xtest))],'-append');
% end

net = newrb(Xtrain,Ttrain,eg,57,200);
mse(net,Ttest,net(Xtest))

return
