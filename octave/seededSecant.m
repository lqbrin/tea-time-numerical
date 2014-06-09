%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin        14 January 2014 %
% Purpose: Implementation of the Seeded Secant   %
% Method.                                        %
% INPUT: function g; initial value x0; tolerance %
%        TOL, maximum iterations N0              %
% OUTPUT: approximation x and number of          %
%        iterations i or message of failure      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x,i] = seededSecant(g,x0,TOL,N0)
  i=2;
  y0=g(x0);
  x1=x0+y0;
  y1=g(x1);
  while (i<=N0)
    x=x1-y1*(x1-x0)/(y1-y0);
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