%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                           29 January 2012 %
% Purpose: This function implements the bisection method where   %
%        the number of iterations is calculated, not supplied as %
%        an argument                                             %
% INPUT: function f; interval [a,b]; tolerance tol               %
% OUTPUT: approximation p; f(p), FP; number of iterations N0     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [p,FP,N0] = bisection(f,a,b,tol)
  i = 1;
  FA = f(a);
  N0 = ceil((log(abs(b-a))-log(tol))/log(2));
  while (i<=N0)
    p = a + (b-a)/2;
    FP = f(p);
    if (FP == 0)
      return
    endif
    i = i+1;
    if (FA*FP > 0)
      a = p;
      FA = FP;
    else
      b = p;
    end%if
  end%while
end%function
