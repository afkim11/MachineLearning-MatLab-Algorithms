function [J grad]=costeRN(params_rn,num_entradas,num_ocultas,num_etiquetas,X,y,lambda)
Theta1=reshape(params_rn(1:num_ocultas*(num_entradas+1)),num_ocultas,(num_entradas+1));
Theta2=reshape(params_rn((1+(num_ocultas * (num_entradas + 1))):end),num_etiquetas,(num_ocultas+1));
 
m=rows(y);

X=[ones(m,1) X];
z=X*Theta1';
a2=sigmoide(z);
a2=[ones(rows(a2),1) a2];
z2=a2*Theta2';
H0=sigmoide(z2);
vectorY = zeros(m,num_etiquetas);

for i = 1:m
    vectorY(i,y(i)) = 1;
end

J = (1/m) * sum(sum(-1 * vectorY .* log(H0)-(1-vectorY) .* log(1-H0)));

parteRegularizada = (lambda/(2*m) * (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2))));
J=J+parteRegularizada;



Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

for i = 1:m

	
	a1 = X(i,:)';

	
	z2 = Theta1 * a1;
	a2 = [1; sigmoide(z2)];

	z3 = Theta2 * a2;
	a3 = sigmoide(z3);

	yy = ([1:num_etiquetas]==y(i))';
	
	delta_3 = a3 - yy;

	delta_2 = (Theta2' * delta_3) .* [1; sigmoideGradiente(z2)];
	delta_2 = delta_2(2:end);

	

	
	Theta1_grad = Theta1_grad + delta_2 * a1';
	Theta2_grad = Theta2_grad + delta_3 * a2';
end

Theta1_grad = (1/m) * Theta1_grad + (lambda/m) * [zeros(size(Theta1, 1), 1) Theta1(:,2:end)];
Theta2_grad = (1/m) * Theta2_grad + (lambda/m) * [zeros(size(Theta2, 1), 1) Theta2(:,2:end)];

grad = [Theta1_grad(:) ; Theta2_grad(:)];


endfunction
