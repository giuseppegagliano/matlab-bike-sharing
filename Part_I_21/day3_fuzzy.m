clc
clear

fuzzy_daily = readfis('gagliano\Part_I_21\day3_fuzzy.fis');

M = csvread('gagliano\day0.csv',1,0);
X = M(:,[3 4 5 7 9 11]);
T = M(:,14);

% % Out of bound detecting
% UpBounds=max([X T]);
% LowBounds=min([X T]);
% plot(X(:,6),'+')
% % NB: The feature atemp has several outliers that has to be removed
for i=1:size(X),
    if X(i,6)>1, X(i,6)=X(i-1,6);
    end
end

% % Plots
% plot(X(:,1),T,'+')
% xlabel('Season');
% ylabel('Count');
% export_fig(gcf,'gagliano\Part_I_21\day\season');
% plot(X(:,2),T,'+')
% xlabel('Year');
% ylabel('Count');
% export_fig(gcf,gagliano\Part_I_21\day\yr');
% plot(X(:,3),T,'+')
% xlabel('Month');
% ylabel('Count');
% export_fig(gcf,'gagliano\Part_I_21\day\mnth');
% plot(X(:,4),T,'+')
% xlabel('Weekday');
% ylabel('Count');
% export_fig(gcf,'gagliano\Part_I_21\day\weekday');
% plot(X(:,5),T,'+')
% xlabel('Weathersit');
% ylabel('Count');
% xlim([1 4]);
% export_fig(gcf,'gagliano\Part_I_21\day\weathersit');
% plot(X(:,6),T,'+')
% xlabel('Feeling Temperature');
% ylabel('Count');
% xlim([0 1]);
% export_fig(gcf,'gagliano\Part_I_21\day\atemp');

O = evalfis(X,fuzzy_daily);
plot([T O])

ME=mean(O-T)
MAE=mean(abs(T-O))
MSE=mse(T,O)

MPE=mean((O-T)./O*100)
MAPE=mean(abs(T-O)./O*100)
