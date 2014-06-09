%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                           1 February 2014 %
% Purpose: This function implements the bisection method where   %
%        the number of iterations is calculated, not supplied as %
%        an argument                                             %
% INPUT: function f; interval [a,b]; tolerance tol               %
% OUTPUT: approximation p; f(p), FP; number of iterations i      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [p,FP,i] = bisectionWhile(f,a,b,tol)
  if (tol<=0)
    p = "ERROR:tol must be positive.";
    return
  end%if
  p = a + (b-a)/2;
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
