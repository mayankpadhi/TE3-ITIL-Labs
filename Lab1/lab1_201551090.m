denominatorProbability = 0;
for i = 0:1:10
  denominatorProbability += nchoosek(10, 3)* power((i/10), 3)* (power(((10-i)/10), 7));
endfor

for i = 0:10
   numeratorProbability = (nchoosek(10, 3)* power((i/10), 3)* (power(((10-i)/10), 7)));
   prob = (numeratorProbability/denominatorProbability)*(1/11);
   printf ("The probality of selection of Urn #%d is %d\n", i, prob);
endfor