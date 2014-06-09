%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin           2 April 2012   %
% Purpose: Implementation of composite Trapezoidal %
% rule                                             %
% INPUT: function f, interval endpoints a and b,   %
%        number of subintervals n                  %
% OUTPUT: approximate integral of f(x) from a to b %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function integral = compositeTrapezoidal(f,a,b,n)
  h = (b-a)/n;
  s = 0;
  for i = 1:n-1
    s = s + f(a+i*h);
  end%for
  integral = h*(f(a)+2*s+f(b))/2;
end%function