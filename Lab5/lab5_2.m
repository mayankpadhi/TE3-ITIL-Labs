#{
ITIL Lab: 5 Problem: 2
Submission by: -
 - > Akash Agrawal(201551090)
 - > Mayank Padhi(201551092)
#}

clc;
close all;
clear all;

ipString = [0 1 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0];
ipString= ipString';

currDist= 1;
currRange= [0; 1];
ratio= 0.9;

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

%----------------------------------PART 2------------------------------------%

newDist= 1;
newRange= [0; 1];
newRatio= 0.5;

while ( newRange(1, 1)< currRange(1, 1) && newRange(2, 1)> currRange(2, 1))
  if(mean(newRange)> currRange(1, 1))
    newDist= newDist* newRatio;
    newRange(2, 1)= newRange(1, 1)+ newDist;
  else
    newDist= newDist* (1- newRatio);
    newRange(1, 1)= newRange(2, 1)- newDist;
  endif
  i++;
endwhile

output_precision(16)
currRange
currDist

output_precision(16)
newRange
newDist