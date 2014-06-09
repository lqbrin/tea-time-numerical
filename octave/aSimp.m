%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                15 May 2014  %
% Purpose: Implementation of adaptive Simpson's    %
% rule                                             %
% INPUT: function f, interval endpoints a and b,   %
%        f0=f(a), f2=f((a+b)/2), f4=f(b), desired  %
%        accuracy TOL.                             %
% OUTPUT: approximate integral of f(x) from a to b %
%         within TOL of actual.                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function res = aSimp(f,a,b,f0,f2,f4,TOL)
  h = (b-a)/4;
  f1 = f(a+h);
  f3 = f(a+3*h);
  error = abs(h*(f0-4*(f1+f3)+6*f2+f4))/45;
  if (error <= TOL)
    res = h/3*(f0+4*(f1+f3)+2*f2+f4);
  else
    res = aSimp(f,a,a+2*h,f0,f1,f2,TOL/2) + aSimp(f,a+2*h,b,f2,f3,f4,TOL/2);
  end%if
end%function