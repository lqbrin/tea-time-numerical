%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin       15 January 2014 %
% Purpose: Implementation of the Secant method. %
% INPUT: function g; initial values x0 and x1;  %
%        tolerance TOL; maximum iterations N0   %
% OUTPUT: approximation x and number of         %
%        iterations i; or message of failure    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x,i] = secantPrint(g,x0,x1,TOL,N0)
  i=2;
  y0=g(x0);
  y1=g(x1);
  while (i<=N0)
    if (abs(y1-y0)<TOL)
      return
    end%if
    x=x1-y1*(x1-x0)/(y1-y0);
    printf("%i  %15.10g %15.10gi\n",i,real(x),imag(x));
    if (abs(x-x1)<TOL)
      return
    end%if
    i=i+1;
    x0=x1;
    y0=y1;
    x1=x;
    y1=g(x1);
  end%while
  x="Method failed---maximum number of iterations reached";
end%function
