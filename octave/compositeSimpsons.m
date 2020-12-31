%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin           3 March 2017   %
% Purpose: Implementation of composite Simpson's   %
% Method                                           %
% INPUT: function f, interval endpoints a and b,   %
%        number of subintervals n                  %
% OUTPUT: approximate integral of f(x) from a to b %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function integral = compositeSimpsons(f,a,b,n)
  h = (b-a)/(2*n);
  s1 = 0;
  s2 = 0;
  for i = 1:2:2*n-1
    s1 = s1 + f(a+i*h);
  end%for
  for i = 2:2:2*n-2
    s2 = s2 + f(a+i*h);
  end%for
  integral = h*(f(a)+4*s1+2*s2+f(b))/3;
end%function
