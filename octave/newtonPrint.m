%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin          15 January 2012 %
% Purpose: Implementation of Newton's Method       %
% INPUT: function g and its derivative gp; initial %
%        value x0; tolerance TOL; maximum number   %
%        of iterations N0                          %
% OUTPUT: approximation x and number of iterations %
%        i; or message of failure                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x,i] = newtonPrint(g,gp,x0,TOL,N0)
  i=1;
  while (i<=N0)
    x=x0-g(x0)/gp(x0);
    printf("%i  %15.10g %15.10gi\n",i,real(x),imag(x));
    if (abs(x-x0)<TOL)
      return
    end%if
    i=i+1;
    x0=x;
  end%while
  x="Method failed---maximum number of iterations reached";
end%function
