%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin      14 February 2014 %
% Purpose: Implementation of the Method of      %
%        False Position.                        %
% INPUT: function g; initial values a and b;    %
%        tolerance TOL; maximum iterations N0   %
% OUTPUT: approximation x and number of         %
%        iterations i; or message of failure    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [x,i] = falsePositionPrint(g,a,b,TOL,N0)
  i=2;
  A=g(a);
  B=g(b);
  xlast=b;
  x=a;
  while (i<=N0)
    if (abs(x-xlast)<TOL)
      return
    end%if
    xlast=x;
    x=b-B*(b-a)/(B-A);
    printf("%4d%17.12g%17.12g%17.12g\n",i,a,x,b);
    if (abs(x-b)<TOL)
      return
    end%if
    i=i+1;
    Y=g(x);
    if (A*Y<0)
      b=x;
      B=Y;
    else
      a=x;
      A=Y;
    end%if
  end%while
  x="Method failed---maximum number of iterations reached";
end%function