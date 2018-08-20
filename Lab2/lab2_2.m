#{
ITIL Lab: 2 Problem: 2
Submission by:-
 -> Akash Agrawal(201551090)
 -> Mayank Padhi(201551092)
#}

close all;
clear all;

# Source Generation
s = zeros(65536, 1);
for i = 1:1:65536
	if (rand() < 0.5)
		s(i) = 0;
	else
		s(i) = 1;
	endif
endfor

# Encoder (3, 1)
t = zeros(196608, 1);
for i = 1:1:65536
	t(i*3 - 2) = s(i);
	t(i*3 - 1) = s(i);
	t(i*3) = s(i);
endfor

#Introducing error in the transmission stream 't'
for i= 1:1:size(t)(1,1)
  probab = rand(1);
  if(probab< 0.05)
    if(t(i,1)== 0)
      t(i,1)= 1;
    else
      t(i,1)= 0;
    endif
  endif
endfor

#Decoding the Transmitted Stream
sPrime= [];
for i= 1:1:(size(t)(1,1)-2)
  if(mod(i,3)== 1)
    if(sum(t(i:(i+2), 1) == 1)> 1)
      sPrime = vertcat(sPrime,[1]);
    else
      sPrime = vertcat(sPrime,[0]);
    endif
  endif
endfor

#Computing the error
errBit= 0;
for i= 1:1:((size(s)(1,1))-1)
  if(sPrime(i, 1)!= s(i, 1))
    errBit+= 1;
  endif
endfor
errRate= (errBit/size(s)(1,1));

printf("The number of error bits is %d and error rate is %d\n", errBit, errRate)