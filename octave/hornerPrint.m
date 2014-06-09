%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin         18 February 2012 %
% Purpose: Implementation of Horner's Method for   %
%        polynomials of the form                   %
%   p(x) = c1 + c2*x + c3*x^2 + ... + c(n+1)*x^n   %
% INPUT: coefficients c, number x0 at which to     %
%        evaluate the polynomial.                  %
% OUTPUT: p(x0) p; and coefficients of q(x), the   %
%        quotient p(x) / (x-x0)                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function p = hornerPrint(x0,c)
  n=length(c);
  p=c(n);
  printf("%4d%17.12g\n",n,p);
  for j=1:n-2
    p=x0*p+c(n-j);
    printf("%4d%17.12g\n",n-j,p);
  end%for
  p=x0*p+c(1);
end%function
