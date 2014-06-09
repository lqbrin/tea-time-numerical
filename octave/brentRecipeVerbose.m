%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin           21 May 2014 %
% Purpose: Implementation of Brent's method.    %
% INPUT: function g; initial values a and b;    %
%        tolerance TOL; maximum iterations N0   %
% OUTPUT: approximation x and number of         %
%        iterations i; or message of failure    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [b,i] = brentRecipeVerbose(g,a,b,tol,N)
  EPS=3.0e-8;
  A=g(a); B=g(b); c=b; C=B;
  for i=2:N+1
    i
    disp("Begin with...");
    disp("-------------");
    a
    b
    c
    disp("-------------");
    if (B*C>0)
      disp("B*C > 0");
      c=a
      C=A
      d=b-a
      e=d
    end%if
    if (abs(C)<abs(B))
      disp("|C| < |B|");
      a=b
      b=c
      c=a
      A=B
      B=C
      C=A
    end%if
    tol1=2*EPS*abs(b)+.5*tol
    xm=.5*(c-b)
    if (abs(xm)<=tol1 || B==0)
      return;
    end%if
    if (abs(e)>=tol1 && abs(A)>abs(B))
      disp("Moving fast enough...");
      s=B/A
      if (a==c)
        disp("a = c : using secant?");
        p=2*xm*s
        q=1-s
      else
        disp("a != c : using inverse quadratic");
        q=A/C
        r=B/C
        p=s*(2*xm*q*(q-r)-(b-a)*(r-1))
        q=(q-1)*(r-1)*(s-1)
      end%if
      if (p>0)
        disp("p > 0");
        q=-q
      end%if
      p=abs(p)
      min1=3*xm*q-abs(tol1*q)
      min2=abs(e*q)
      if (2*p < min([min1,min2]))
        disp("2p < min(min1,min2) : interpolation OK");
        e=d
        d=p/q
      else
        disp("2p < min(min1,min2) : interpolation failed -- using bisection");
        d=xm
        e=d
      end%if
    else
      disp("Moving too slowly--using bisection");
      d=xm
      e=d
    end%if 
    a=b
    A=B
    if (abs(d)>tol1)
      disp("|d| > tol1 : incrementing by d");
      b=b+d
    else
      disp("|d| <= tol1 : incrementing by tol1");
      b=b+abs(tol1)*abs(xm)/xm
    end%if
    B=g(b)
    disp("End with...");
    disp("-------------");
    a
    b
    c
    disp("-------------");
    disp(" ");
  end%for
  b="Method failed---maximum number of iterations reached";
end%function