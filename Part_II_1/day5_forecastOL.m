clear;
clc;
M=csvread('gagliano\day0.csv',1,0,[1,0,365,13]);

T = M(:,14)';
X = M(:,[3 4 5 7 9 11])';

inputSeries = tonndata(X,true,false);
targetSeries = tonndata(T,true,false);

dlmwrite('gagliano\Part_II_1\day5_forecastOL_ME.csv',['i' 'j' 'p'],'-append');

for i=1:30,
    for j=5:5:25,
        % Create a Time Delay Network
        inputDelays = 0:i;
        hiddenLayerSize = j;
        net = timedelaynet(inputDelays,hiddenLayerSize);

        % Prepare the Data for Training and Simulation
        [inputs,inputStates,layerStates,targets] = preparets(net,inputSeries,targetSeries);

        % Setup Division of Data for Training, Validation, Testing
        net.divideParam.trainRatio = 70/100;
        net.divideParam.valRatio = 15/100;
        net.divideParam.testRatio = 15/100;


        % Train the Network
        [net,tr] = train(net,inputs,targets,inputStates,layerStates);

        % Test the Network
        outputs = net(inputs,inputStates,layerStates);
        errors = gsubtract(targets,outputs);
        performance = perform(net,targets,outputs)
        dlmwrite('gagliano\Part_II_1\day5_forecastOL_MSE.csv',[i j performance],'-append');

        % View the Network
        %view(net)

        % Plots
         figure, plotperform(tr)
         export_fig(gcf,strcat('gagliano\Part_II_1\plots\performance_delay=',num2str(i),'_hidden',num2str(j)));
         figure, plottrainstate(tr)
         export_fig(gcf,strcat('gagliano\Part_II_1\plots\trainstate_delay=',num2str(i),'_hidden',num2str(j)));
         figure, plotresponse(targets,outputs)
         export_fig(gcf,strcat('gagliano\Part_II_1\plots\response_delay=',num2str(i),'_hidden',num2str(j)));
         figure, ploterrcorr(errors)
         export_fig(gcf,strcat('gagliano\Part_II_1\plots\autocorrelation_delay=',num2str(i),'_hidden',num2str(j)));
        figure, plotinerrcorr(inputs,errors)
        export_fig(gcf,strcat('gagliano\Part_II_1\plots\crosscorrelation_delay=',num2str(i),'_hidden',num2str(j)));
        close all
    end
end
