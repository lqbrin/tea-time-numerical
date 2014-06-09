%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin           20 May 2014 %
% Purpose: Implementation of bracketed Newton's %
%        method.                                %
% INPUT: function g; its derivative gp; initial %
%        values a and b; tolerance TOL; maximum %
%        iterations N                           %
% OUTPUT: approximation x and number of         %
%        iterations i; or message of failure    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,i] = bracketedNewton(g,gp,a,b,TOL,N)
  i=1;
  A=g(a);
  B=g(b);
  while (i<N)
    b
    x=b-B/gp(b);
    if (x<min([a,b]) || x>max([a,b]))
      x=b+(a-b)/2;
    end%if
    g(x);
    if (abs(x-b)<TOL)
      disp(" ");
      return
    end%if
    X=g(x);
    if ((B<0 && X>0) || (B>0 && X<0))
      a=b; A=B;
    end%if
    b=x; B=X;
    i=i+1;
  end%while
  x="Method failed---maximum number of iterations reached";
end%function