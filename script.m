function [] = script()

% 10000 features. '1' -> Cancer  '-1' -> No cancer		We change it to: '1'->Cancer  '2' -> No cancer
%Load of each file
Xtrain=dlmread('arcene_train.data',' ');
ytrain=dlmread('arcene_train.labels',' ');
Xval=dlmread('arcene_valid.data',' ');
yval=dlmread('arcene_valid.labels',' ');
Xtest=dlmread('arcene_test.data',' ');
%delete the last column because it's not a desirable column
Xtrain(:,10001)=[];
Xval(:,10001)=[];
%Xtest(:,10001)=[];
warning('off', 'Octave:possible-matlab-short-circuit-operator');
%Xtrain=[Xtrain;Xval(1:50,:)];
%Xval=Xval(51:100,:);
%ytrain=[ytrain;yval(1:50,1)];
%yval=yval(51:100,1);



%Logistic Regression multiclass
regresionLogisticaMulticlase(Xtrain,ytrain,Xval,yval,Xtest);


%Support Vector Machine
%supportVectorMachine(Xtrain,ytrain,Xval,yval);

valores=[10 25 75 125 175 250 500];
numOcultas=75;
%Redes Neuronales
%redesNeuronales(Xtrain,ytrain,Xval,yval,numOcultas);





endfunction
