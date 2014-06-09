%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin           21 May 2014 %
% Purpose: Implementation of inverse quadratic  %
%        interpolation root finding method.     %
% INPUT: function g; initial values a and b;    %
%        tolerance TOL; maximum iterations N0   %
% OUTPUT: approximation x and number of         %
%        iterations i; or message of failure    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,i] = inverseQuadratic(g,a,b,TOL,N0)
  i=2;
  A=g(a);
  c=b;
  C=g(c);
  b=(a*C-c*A)/(C-A);
  B=g(b);
  while (i<N0)
    c
    r=B/C; s=B/A; t=A/C;
    p=s*(t*(r-t)*(c-b)-(1-r)*(b-a));
    q=(t-1)*(r-1)*(s-1);
    x=b+p/q;
    del=x-c;
    a=b;
    A=B;
    b=c;
    B=C;
    c=x;
    C=g(c);    
    i=i+1;
    if (abs(del)<TOL || C==0)
      return
    end%if
  end%while
  x="Method failed---maximum number of iterations reached";
end%function