#{
ITIL Lab: 2 Problem: 1
Submission by: -
 - > Akash Agrawal(201551090)
 - > Mayank Padhi(201551092)
#}
clc;
close all;
clear all;
s = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '-'];
p = [0.0575, 0.0128, 0.0263, 0.0285, 0.0913, 0.0173, 0.0133, 0.0313, 0.0599, 0.0006, 0.0084, 0.0335, 0.0235, 0.0596, 0.0689, 0.0192, 0.0008, 0.0508, 0.0567, 0.0706, 0.0334, 0.0069, 0.0119, 0.0073, 0.0164, 0.0007, 0.1928];

i = 1;
%sorted s and p
for m = 1:length(p)
    for n = 1:length(p)
        if (p(m) > p(n))
            a = p(n);
            a1 = s(n);
            p(n) = p(m);
            s(n) = s(m);
            p(m) = a;
            s(m) = a1;
        end
    end
end
%arranged prob. in descending order.

toInsert = [0];
sumList = [];
w = length(p);
lengthp = [w];
b(i, :) = p;

while (length(p) > 2)
    minTwo = p(length(p)) + p(length(p) - 1); %taking sum of the minimum 2
    sumList = [sumList, minTwo]; % updating the sum array
    p = [p(1:length(p) - 2), minTwo];
    p = sort(p, 'descend');
    i = i + 1;
    b(i, :) = [p, zeros(1, w - length(p))];
    w1 = 0;
    lengthp = [lengthp, length(p)];
 
    for temp = 1:length(p)
        if p(temp) == minTwo;
            w1 = temp;
        end
    end
    toInsert = [w1, toInsert]; % Find the place where tempsum has been inserted
end

sizeb(1:2) = size(b);
tempCode = 0;            % storing temp Code 0's and 1's
temp2 = [];

for i = 1:sizeb(2)
    temp2 = [temp2, b(1, i)];
end

sumList = [0, sumList];
var = [];
e = 1;
for ifinal = 1:sizeb(2)
    finalCode = [s(ifinal), ' ---> ']
    for j = 1:sizeb(1)
        tempCode = 0;
     
        for i1 = 1:sizeb(2)
            if (b(j, i1) == temp2(e))
                tempCode = b(j, i1);
            end
            if (tempCode == 0 && b(j, i1) == sumList(j))
                tempCode = b(j, i1);
            end
        end
        var = [var, tempCode];
        if tempCode == b(j, lengthp(j)) %assign 0 & 1
            finalCode = [finalCode, '1'];
        elseif tempCode == b(j, lengthp(j) - 1)
            finalCode = [finalCode, '0'];
        else
            finalCode = [finalCode, ''];
        end
        temp2(e) = tempCode;
    end
    display(finalCode); %display final codeword
    e = e + 1;
end
