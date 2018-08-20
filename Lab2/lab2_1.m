#{
ITIL Lab: 2 Problem: 1
Submission by:-
 -> Akash Agrawal(201551090)
 -> Mayank Padhi(201551092)
#}
close all;
clear all;
ipString = zeros(65536, 1);

# Generation of Source Bits
for i = 1:1:65536
	if (rand(1) < 0.5)
		ipString(i) = 0;
	else
		ipString(i) = 1;
	endif
endfor

errBit= 0;
# Simulation of error in propogation
for i= 1:1:size(ipString)(1,1)
  probab = rand(1);
  if(probab< 0.05)
    if(ipString(i,1)== 0)
      ipString(i,1)= 1;
    else
      ipString(i,1)= 0;
    endif
    errBit+= 1;
  endif
endfor

# Calculation of error rate
errRate= (errBit/size(ipString)(1,1));

printf("The number of error bits is %d and error rate is %d\n", errBit, errRate)
