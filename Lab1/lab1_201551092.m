# Tutorial 1 problem 3(a)
# Submission by Mayank Padhi(201551092)

denoP1= 0;
for i = 0:1:10
  denoP1+= nchoosek(10, 3)* ((i/10).^3)* (((10-i)/10).^ 7);
endfor

#denoP1
for i = 0:10
   ans= nchoosek(10, 3)* ((i/10).^ 3)* (((10-i)/10).^ 7)* (1/(11*denoP1));
   printf ("Probality of urn %d is %d\n", i, ans);
endfor
