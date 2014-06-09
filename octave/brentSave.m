%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin           21 May 2014 %
% Purpose: Implementation of Brent's method.    %
% INPUT: function g; initial values a and b;    %
%        tolerance TOL; maximum iterations N0   %
% OUTPUT: approximation x and number of         %
%        iterations i; or message of failure    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,i] = brent(g,a,b,TOL,N0)
  i=2;
  A=g(a);
  B=g(b);
  c=b;
  C=B;
  while (i<N0)
    b
    % Make sure root is between b and c and that
    % b is the best guess
    if (B*C>0)
      c=a; C=A;
    end%if
    if (abs(C) < abs(B))
      a=b; A=B;
      b=c; B=C;
      c=a; C=A;
    end%if
    if (c==a)
      x=(b*C-c*B)/(C-B);
      del=x-b;
      a=b; A=B;
      b=x; B=g(b);
    else
      r=B/C; s=B/A; t=A/C;
      p=s*(t*(r-t)*(c-b)-(1-r)*(b-a));
      q=(t-1)*(r-1)*(s-1);
      x=b+p/q;
      if ((x-c)*(x-b)>0)
        x=b+(c-b)/2;
      end%if
      del=x-b;
      a=b; A=B;
      b=x; B=g(b);
    end%if
    i=i+1;
    if (abs(del)<TOL)
      return
    end%if
  end%while
  x="Method failed---maximum number of iterations reached";
end%function