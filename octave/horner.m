%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin         18 February 2012 %
% Purpose: Implementation of Horner's Method for   %
%        polynomials of the form                   %
%   p(x) = c1 + c2*x + c3*x^2 + ... + c(n+1)*x^n   %
% INPUT: coefficients c, number x0 at which to     %
%        evaluate the polynomial.                  %
% OUTPUT: p(x0) p; and p'(x0) pprime               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [p,pprime] = horner(x0,c)
  n=length(c);
  p=c(n);
  pprime=c(n);
  for j=1:n-2
    p=x0*p+c(n-j);
    pprime=x0*pprime+p;
  end%for
  p=x0*p+c(1);
end%function
