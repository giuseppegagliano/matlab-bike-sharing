clear;
clc;
M=csvread('gagliano\hour0.csv',1,0);
[Itrain,null,Itest]=dividerand(size(M,1),70,0,30);

Ttrain = M(Itrain,14)';
Xtrain = M(Itrain,[3 4 5 6 9 10 11])';
Ttest = M(Itest,14)';
Xtest = M(Itest,[3 4 5 6 9 10 11])';
eg = 0.02;                  %   sum-squared error goal

% % DISTANCE BETWEEN ADJACENT INPUT VECTORS
% Dadj=zeros(size(Xtrain,2),1);
% for i=2:1:size(Xtrain,2)-1,    Dadj(i-1) = sum((Xtrain(:,i-1)-Xtrain(:,i)).^2).^0.5;
% end
% plot(Dadj);
% % ylim([0 7])
% 
% 
% % DISTANCE OF THE INPUT SPACE
% Xnorm=sqrt(sum(Xtrain.^2,1));
% Dsp=2*max(Xnorm)



% for sc=23:5:53,                             %   spread constant
%     net = newrb(Xtrain,Ttrain,eg,sc,30);
%     ylim([0 10^4])
%     export_fig(gcf,strcat('gagliano\Part_I_12\hour\sc',num2str(sc*10)));
%     dlmwrite('gagliano\Part_I_12\hour\hour2_rbf_mse.csv',[sc mse(net,Ttest,net(Xtest))],'-append');
% end


net = newrb(Xtrain,Ttrain,eg,38,50);
mse(net,Ttest,net(Xtest))

return