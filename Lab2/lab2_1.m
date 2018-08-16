#{
ITIL Lab: 2 Problem: 1
Submission by:-
 -> Akash Agrawal(201551090)
 -> Mayank Padhi(201551092)
#}
close all;
clear all;
ipString = zeros(65536, 1);
for i = 1:1:65536
	if (rand(1) < 0.5)
		ipString(i) = 0;
	else
		ipString(i) = 1;
	endif
endfor

#ipString= zeros(10,1);
errBit= 0;
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
errRate= (errBit/size(ipString)(1,1));

printf("Hence the error bits is %d and error rate is %d", errBit, errRate)
