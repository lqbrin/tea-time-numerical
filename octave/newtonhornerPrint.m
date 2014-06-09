%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin         18 February 2012 %
% Purpose: Implementation of Newton's Method for   %
%         polynomials of the form                  %
%   p(x) = c1 + c2*x + c3*x^2 + ... + c(n+1)*x^n   %
%         using Horner's Method                    %
% INPUT: coefficients c; initial approximation x0; %
%         tolerance TOL; maximum number of         %
%         iterations N0                            %
% OUTPUT: approximation x and number of iterations %
%         i; or error message of failure           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x,i] = newtonhornerPrint(c,x0,TOL,N0)
  i=1;
  while (i<=N0)
    [f0,fp0] = horner(x0,c);
    if (fp0==0)
      x0=x0+2*TOL;
      [f0,fp0] = horner(x0,c);
      x=x0-f0/fp0;
    else
      x=x0-f0/fp0;
    end%if
    if (abs(x-x0)<TOL)
      return
    end%if
    i=i+1;
    x0=x;
    printf("%4d%17.12g\n",i,x);
  end%while
  x="Method failed---maximum number of iterations reached";
end%function