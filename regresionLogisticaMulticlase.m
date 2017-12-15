function []=regresionLogisticaMulticlase(Xtrain,ytrain,Xval,yval,Xtest)
m=rows(Xtrain);
mval=rows(Xval);
mtest=rows(Xtest);
n=columns(Xtrain);

lambdas=[0.001 0.003 0.01 0.03 0.1 0.3 1 3 10];
iteraciones=25;
numImage=1;
recall=[0 0 0];

ytrain=cambiarValores(ytrain,-1,2);%Aqui 1-> cancer, 2->no cancer
yval=cambiarValores(yval,-1,2);%Aqui 1-> cancer, 2->no cancer
%for i=1:5
iteraciones=iteraciones+25
resultados=[];
%for j=1:length(lambdas)
lambda=lambdas(5)
thetaOptimo=oneVsAll(Xtrain,ytrain,2,lambda,iteraciones);

etiquetas=[1 2];

for i=1:mval
	y1=Xval(i,:)*thetaOptimo';
	y1=(y1==(max(y1)));
	y1=etiquetas*y1';
	Y(i,1)=sum(y1);
endfor
correctos=(yval==Y);
resultado=(sum(correctos)/mval)*100;
resultados=[resultados resultado];
printf("El porcentaje de aciertos sobre los ejemplos de validacion es %d con regresion logistica multiclase\n\n",resultado)

%for i=1:mtest
%	y2=Xtest(i,:)*thetaOptimo';
%	y2=(y2==(max(y2)));
%	y2=etiquetas*y2';
%	Y2(i,1)=sum(y2);
%endfor
%positivos=sum(Y2==1);
%negativos=sum(Y2==2);

%printf("El numero de ejemplos que han dado positivo es %d (310), mientras que han dado negativo %d (390) con regresion logistica multiclase\n\n",positivos,negativos)

fallos=yval!=Y;
for i=1:rows(yval)

if (fallos(i))
  recall(3)=recall(3)+1;
if (Y(i)==1) %Falso negativo
  recall(2)=recall(2)+1;
elseif (Y(i)==2) %Falso positivo
  recall(1)=recall(1)+1;

endif
endif;
endfor
recall

%endfor
figure(numImage);
plot(lambdas,resultados);
xlabel("Valores Lambda");
ylabel("Porcentaje de aciertos");
s=sprintf("Regresion logistica con %i iteraciones",iteraciones);
title(s);


numImage=numImage +1;

%endfor




endfunction
