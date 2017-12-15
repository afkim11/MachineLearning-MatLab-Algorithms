function [all_theta] = oneVsAll(X,y,num_etiquetas,lambda,iteraciones)

n=columns(X);
initial_theta=zeros(n,1);
options= optimset('GradObj','on','MaxIter',iteraciones);
theta=fmincg(@(t)(lrCostFunctionRegularizada(t,X,(y == 1),lambda)),initial_theta,options);
all_theta=theta';
theta=fmincg(@(t)(lrCostFunctionRegularizada(t,X,(y == 2),lambda)),initial_theta,options);
all_theta=[all_theta;theta'];

endfunction