#{
ITIL Lab: 5 Problem: 1
Submission by: -
 - > Akash Agrawal(201551090)
 - > Mayank Padhi(201551092)
#}
clc;
close all;
clear all;

%generating a random string of length 50
ipString = zeros(50, 1);
for i = 1:1:50
	if (rand(1) < 0.5)
		ipString(i) = 0;
	else
		ipString(i) = 1;
	endif
endfor


currDist= 1;
currRange= [0; 1];
ratio= 0.9;
%currRange(2, 1)

% The first iteration
if(ipString(1, 1)== 0)
  currRange(2, 1)= ratio;
else
  currRange(1, 1)= ratio;
endif

i= 2;

while (i <= 50)
  if(ipString(i, 1)== 0)
    currDist= currDist* ratio;
    currRange(2, 1)= currRange(1, 1)+ currDist;
  else
    currDist= currDist* (1- ratio);
    currRange(1, 1)= currRange(2, 1)- currDist;
  endif
  i++;
endwhile

output_precision(16)
currRange
currDist
