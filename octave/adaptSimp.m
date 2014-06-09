%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                15 May 2014  %
% Purpose: Implementation of adaptive Simpson's    %
% rule                                             %
% INPUT: function f, interval endpoints a and b,   %
%        desired accuracy TOL.                     %
% OUTPUT: approximate integral of f(x) from a to b %
%         within TOL of actual.                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function res = adaptSimp(f,a,b,TOL)
  h = (b-a)/4;
  f0 = f(a);
  f1 = f(a+h);
  f2 = f(a+2*h);
  f3 = f(a+3*h);
  f4 = f(b);
  error = abs(h*(f0-4*(f1+f3)+6*f2+f4))/45;
  if (error <= TOL)
    res = h/3*(f0+4*(f1+f3)+2*f2+f4);
  else
    res = adaptSimp(f,a,a+2*h,TOL/2) + adaptSimp(f,a+2*h,b,TOL/2);
  end%if
end%function