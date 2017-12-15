function [] = supportVectorMachine(Xtrain,ytrain,Xval,yval)

ytrain=cambiarValores(ytrain,-1,0);%Aqui 1-> cancer, 0->no cancer

C=1;sigma=0.1;
valores=[0.01 0.03 0.1 0.3 1 3 10 30]; 
%for i=1:length(valores)
%C=valores(i);
%for j=1:length(valores)
%sigma=valores(j);
%[Xtrain_norm,mu,sigma]=featureNormalize(Xtrain);
model = svmTrain(Xtrain,ytrain,C,@linearKernel,1e-3,50);
%model2 = svmTrain(Xtrain,ytrain,C,@(x1,x2) gaussianKernel(x1,x2,sigma),1e-1,50);
prediction = svmPredict(model,Xtrain);
%prediction2 = svmPredict(model2,Xtrain_norm);
visualizeBoundary(Xtrain,ytrain,model);
printf("Porcentaje aciertos con kernel lineal: %f \n",sum(prediction==ytrain)/rows(ytrain))
%printf("Porcentaje aciertos con kernel gaussiano: %f \n",sum(prediction2==ytrain)/rows(ytrain))
%endfor
%endfor
end
