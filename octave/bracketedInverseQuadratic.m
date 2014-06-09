%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin           21 May 2014 %
% Purpose: Implementation of bracketed inverse  %
%        quadratic interpolation method.        %
% INPUT: function g; initial values a and b;    %
%        tolerance TOL; maximum iterations N0   %
% OUTPUT: approximation x and number of         %
%        iterations i; or message of failure    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [x,i] = bracketedInverseQuadratic(g,a,b,TOL,N0)
  i=1;
  A=g(a);
  B=g(b);
  c=a; C=A;
  while (i<N0)
    b
    if (B*A>0)
      a=c; A=C;
    end%if
    if (abs(A) < abs(B))
      c=b; C=B;
      b=a; B=A;
      a=c; A=C;
    end%if
    if (a==c)
      x=(b*A-a*B)/(A-B);
    else
      r=B/A-1; s=C/B-1; t=A/C-1;
      p=(t+1)*r*(c-b)+(r+1)*s*(a-b);
      q=t*s*r;
      x=b-p/q;
    end%if
    if (x<min([a,b]) || x>max([a,b]))
      x=b+(a-b)/2;
    end%if
    if (abs(x-b)<TOL)
      disp(" ");
      return
    end%if
    c=b; C=B;
    b=x; B=g(b);
    i=i+1;
  end%while
  x="Method failed---maximum number of iterations reached";
end%function