function sim = gaussianKernel(x1, x2,  sigma)
final=sum((x1-x2).^2)/(2*(sigma^2));
sim=exp(-final);

endfunction
