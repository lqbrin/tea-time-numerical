%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin              12 February 2014 %
% Purpose: deflate a polynomial of the form             %
%      p(x) = c1 + c2*x + c3*x^2 + ... + c(n+1)*x^n     %
%                               given a root.           %
% INPUT: coefficients c of the polynomial; root r of    %
%        of the polynomial                              %
% OUTPUT: coefficients d of the deflated polynomial     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function d = deflate(c,r)
  n=length(c)-1;
  d(n)=c(n+1);
  for i=n-1:-1:1
    d(i)=r*d(i+1)+c(i+1);
  end%for
end%function