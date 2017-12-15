function W= pesosAleatorios(L_in,L_out)
epsilonIni=0.12;
W = rand(L_out,L_in + 1)*2*epsilonIni - epsilonIni;
endfunction
