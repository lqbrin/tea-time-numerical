%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin         15 January 2014 %
% Purpose: Implementation of Steffensen's method  %
% INPUT: function f; initial value x0; tolerance  %
%        TOL; maximum iterations N0               %
% OUTPUT: approximation x and number of           %
%        iterations i; or message of failure      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x,i] = steffensens(f,x0,TOL,N0)
  i=1;
  while (i<=N0)
    x1=f(x0);
    x2=f(x1);
    if (abs(x2-x1)<TOL)
      x=x2;
      return
    end%if
    x=x0-(x1-x0)^2/(x2-2*x1+x0);
    if (abs(x-x2)<TOL)
      return
    end%if
    i=i+1;
    x0=x;
  end%while
  x="Method failed---maximum number of iterations reached";
end%function
