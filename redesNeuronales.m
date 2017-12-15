function [media] = redesNeuronales(Xtrain,ytrain,Xval,yval,numOcultas)
num_etiquetas=2;
num_entradas=columns(Xtrain);
num_ocultas=numOcultas;
numImage=0;
ytrain=cambiarValores(ytrain,-1,2);%Aqui 1-> cancer, 2->no cancer
yval=cambiarValores(yval,-1,2);%Aqui 1-> cancer, 2->no cancer

media=[];
recall=[ 0 0 0 ];
%theta1_inicial = pesosAleatorios(num_entradas,num_ocultas);
%theta2_inicial = pesosAleatorios(num_ocultas,num_etiquetas);
load -text mejorThetaInicialesNeuronales.txt %utilizo unos pesos ya calculados óptimos
thetas_iniciales = [theta1_inicial(:) ; theta2_inicial(:)];



iter=[50 75 100 125 150 175 200];
lambdas=[0.001 0.01 0.03 0.1 0.3 1];
for i=1:length(iter)

thetas_iniciales = [theta1_inicial(:) ; theta2_inicial(:)];

iteraciones=iter(1);
resultados=[];
numImage++;
for j=1:length(lambdas)

lambda=lambdas(4)

opciones = optimset('MaxIter', iteraciones);

[theta_parametros, coste] = fmincg(@(t) costeRN(t,num_entradas,num_ocultas,num_etiquetas, Xtrain, ytrain, lambda), thetas_iniciales, opciones);

Theta1 = reshape(theta_parametros(1:num_ocultas * (num_entradas + 1)), num_ocultas, (num_entradas + 1));
Theta2 = reshape(theta_parametros((1 + (num_ocultas * (num_entradas + 1))):end), num_etiquetas, (num_ocultas + 1));

prediction = calculaValoresGenerados(Theta1, Theta2, Xval);

resultado=sum(prediction==yval)/rows(yval)*100;
resultados=[resultados  resultado]
endfor



figure(numImage);
plot(lambdas,resultados);
xlabel("Valores Lambda ");
ylabel("Porcentaje de aciertos");
titulo=sprintf("Porcentajes/lambda con 75 unidades y %i iteraciones",iteraciones);
title(titulo);
endfor





endfunction
