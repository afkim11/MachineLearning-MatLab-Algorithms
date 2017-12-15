function [ytrain] = cambiarValores(ytrain,oldValue,newValue)

for i=1:rows(ytrain)
 if ytrain(i)==oldValue
 	ytrain(i)=newValue;
 endif
endfor

endfunction
