%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                          10 December 2020 %
% Purpose: This function implements the bisection method where   %
%        the number of iterations is calculated, not supplied as %
%        an argument                                             %
% INPUT: interval [a,b]; function f; tolerance tol               %
% OUTPUT: approximation p; f(p), FP; number of iterations N0     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [p,FP,N0] = bisection(a,b,f,tol)
  FA = f(a);
  N0 = ceil((log(abs(b-a))-log(tol))/log(2));
  for i=1:N0
    p = a + (b-a)/2;
    FP = f(p);
    if (FP == 0)
      return
    endif
    if (FA*FP > 0)
      a = p;
      FA = FP;
    else
      b = p;
    end%if
  end%while
end%function
