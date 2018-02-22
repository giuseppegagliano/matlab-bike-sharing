clc
clear

fuzzy_hourly = readfis('gagliano\Part_I_21\hour3_fuzzy.fis');

M = csvread('gagliano\hour0.csv',1,0);
X = M(:,[3 4 5 6 9 10 11]);
T = M(:,15);

% % Plots
% plot(X(:,1),T,'+')
% xlabel('Season');
% ylabel('Count');
% export_fig(gcf,'gagliano\Part_I_21\hour\season');
% plot(X(:,2),T,'+')
% xlabel('Year');
% ylabel('Count');
% export_fig(gcf,'gagliano\Part_I_21\hour\yr');
% plot(X(:,3),T,'+')
% xlabel('Month');
% ylabel('Count');
% export_fig(gcf,'gagliano\Part_I_21\hour\mnth');
% plot(X(:,4),T,'+')
% xlabel('Hour');
% ylabel('Count');
% export_fig(gcf,'gagliano\Part_I_21\hour\hr');
% plot(X(:,5),T,'+')
% xlabel('Working Day');
% ylabel('Count');
% export_fig(gcf,'gagliano\Part_I_21\hour\workingday');
% plot(X(:,6),T,'+')
% xlabel('Weathersit');
% ylabel('Count');
% export_fig(gcf,'gagliano\Part_I_21\hour\weathersit');
% plot(X(:,7),T,'+')
% xlabel('Temperature');
% ylabel('Count');
% export_fig(gcf,'gagliano\Part_I_21\hour\temp');

O = evalfis(X,fuzzy_hourly);
plot([T O])

ME=mean(O-T)
MAE=mean(abs(T-O))
MSE=mse(T,O)

MPE=mean((O-T)./O*100)
MAPE=mean(abs(T-O)./O*100)
