%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin          15 January 2014 %
% Purpose: Implementation of Newton's Method       %
%        for polynomials of the form               %
%   p(x) = c1 + c2*x + c3*x^2 + ... + c(n+1)*x^n   %
%        using Horner's Method, n > 1.             %
% INPUT: coefficients c; tolerance tol; maximum    %
%        number of iterations N                    %
% OUTPUT: approximations to all roots, roots       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function roots = newthornall(c,tol,N,x0)
  n=length(c)-1;
  for i=1:n-2
    res=newtonhorner(c,x0,tol,N)
    roots(i)=res;
    x0=roots(i);
    c=deflate(c,x0);
  end%for
  [roots(n-1),roots(n)]=quadraticRoots(c(3),c(2),c(1));
end%function
