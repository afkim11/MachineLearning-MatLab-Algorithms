function [J,grad] = lrCostFunctionReguralizada(theta,X,y,lambda)
m=rows(X);
H0=sigmoide(X*theta);
temp1=(-y).*log(H0);
temp2=(1.-y).*log(1.-H0);
tempFinal=temp1.-temp2;
J1=sum(tempFinal)/m;
J2=(lambda/(2*m))*sum(theta.*theta);
J=J1+J2;



tempFinal=(H0.-y)' * X;

theta(1,1)=0;
grad2=(lambda/m).*theta;
grad=(tempFinal/m) .+ grad2';
grad=grad';





endfunction
