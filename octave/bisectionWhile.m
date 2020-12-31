%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                          10 December 2020 %
% Purpose: This function implements the bisection method where   %
%        the number of iterations is calculated, not supplied as %
%        an argument                                             %
% INPUT: interval [a,b]; function f; tolerance tol               %
% OUTPUT: approximation p; f(p) FP; number of iterations i       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [p,FP,i] = bisectionWhile(a,b,f,tol)
  if (tol<=0)
    p = "ERROR:tol must be positive.";
    return
  end%if
  p = a;
  err = abs(b-a);
  FA = f(a);
  i=1;
  while (err>tol)
    i=i+1;
    p = a + (b-a)/2;
    FP = f(p);
    err=err/2;
    if (FP == 0)
      return
    end%if
    if (FA*FP > 0)
      a = p;
      FA = FP;
    else
      b = p;
    end%if
  end%while
end%function
