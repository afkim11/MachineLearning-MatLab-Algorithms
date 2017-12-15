function g = sigmoideGradiente(z)
g=zeros(size(z));


g = sigmoide(z) .* (1 - sigmoide(z));

endfunction