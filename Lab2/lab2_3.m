#{
ITIL Lab: 2 Problem: 3
Submission by:-
 -> Akash Agrawal(201551090)
 -> Mayank Padhi(201551092)
#}
close all;
clear all;

#Generation of the stream
sTotal = zeros(65536, 1);
for i = 1:1:65536
	if (rand() < 0.5)
		sTotal(i) = 0;
	else
		sTotal(i) = 1;
	endif
endfor

error= 0;
finalReceived= [];
t=[];
# Encoding (7, 4)
for q = 1:4:65536
  s= [sTotal(q, 1); sTotal(q+1, 1); sTotal(q+ 2, 1); sTotal(q+3, 1);];
  Gtrans= [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1; 1, 1, 1, 0; 0, 1, 1, 1; 1, 0, 1, 1];
  virtualTrans= Gtrans* s;
  t= vertcat(t, virtualTrans);
endfor

# Introducing error in the transmission stream 't'
for i= 1:1:size(t)(1,1)
	if(mod(t(i, 1), 2)== 0)
	  t(i, 1)= 0;
	else
	  t(i, 1)= 1;
	endif
	probab = rand(1);
	if(probab< 0.05)
	  if(t(i,1)== 0)
		t(i,1)= 1;
	  else
		t(i,1)= 0;
	  endif
	endif
endfor

received= t;
# Decoding the Transmitted Stream
# d is syndrome
H= [1, 1, 1, 0, 1, 0, 0; 0, 1, 1, 1, 0, 1, 0; 1, 0, 1, 1, 0, 0, 1];
for q = 1:7:114688
	newTrans= [t(q); t(q+1); t(q+2); t(q+3); t(q+4); t(q+5); t(q+6);];
	d= H* newTrans;
	for i= 1:1:(size(d)(1,1)- 7)
		if(mod(d(i, 1), 2)== 0)
		  d(i, 1)= 0;
		else
		  d(i, 1)= 1;
		endif
	endfor
	
#Comparing and fixing error
	errorIndex= find(sum(H == repmat(d, 1, 7)) == size(H, 1));
	if(newTrans(errorIndex, 1)== 0)
		newTrans(errorIndex, 1)= 1;
	else
		newTrans(errorIndex, 1)= 0;
	endif
	
	finalReceived= vertcat(finalReceived, newTrans);
endfor

for i= 1:1:size(finalReceived)(1,1)
	if(finalReceived(i, 1)!= received(i, 1))
	  error+=1;
	endif
endfor

errRate= error/size(sTotal)(1,1);
printf("The number of error bits is %d and error rate is %d\n", error, errRate);