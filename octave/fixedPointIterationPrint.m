%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Leon Brin         15 January 2014 %
% Purpose: Implementation of the Fixed Point       %
%        Iteration Method.                         %
% INPUT: function f; initial value x0; tolerance   %
%        TOL; maximum number of iterations N0      %
% OUTPUT: approximation x and number of iterations %
%        i; or message of failure                  %
% Ref: Tea Time Numerical Analysis Section 2.2     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x,i] = fixedPointIterationPrint(f,x0,TOL,N0)
  for i=1:N0
    x=f(x0);
    printf("%4d%17.12g\n",i,x);
    if (abs(x-x0)<TOL)
      return;
    end%if
    x0=x;
  end%for
  x="Method failed---maximum number of iterations reached";
end%function