%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin         15 January 2014 %
% Purpose: Implementation of Steffensen's method  %
% INPUT: function f; initial value x0; tolerance  %
%        TOL; maximum iterations N0               %
% OUTPUT: approximation x and number of           %
%        iterations i; or message of failure      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,i] = bracketedSteffensens(f,a,b,TOL,N0)
  i=1;
  A=f(a);
  B=f(b);
  while (i<=N0)
    b
    x0=b;
    x1=B;
    x2=f(x1);
    if (abs(x2-x1)<TOL)
      x=x2;
      disp(" ");
      return
    end%if
    x=x0-(x1-x0)^2/(x2-2*x1+x0);
    if (x<min([a,b]) || x>max([a,b]))
      x=a+(b-a)/2;
    end%if
    if (abs(x-x2)<TOL)
      disp(" ");
      return
    end%if
    X=f(x);
    if ((B<b && X>x) || (B>b && X<x))
      a=b; A=B;
    end%if
    b=x; B=X;
    i=i+1;
  end%while
  x="Method failed---maximum number of iterations reached";
end%function
