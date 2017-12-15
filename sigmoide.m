function [res] = sigmoide(z)
	res = 1./(e.^z);
	res = 1 .+ res;
	res = 1 ./ res;
endfunction
