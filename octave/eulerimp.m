%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                           29 January 2012 %
% Purpose: This function implements the bisection method where   %
%        the number of iterations is calculated, not supplied as %
%        an argument                                             %
% INPUT: function f(x,y); interval [a,b]; y(a); steps n          %
% OUTPUT: approximation (x(i),y(i)) of the solution of y'=f(x,y) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [y,x] = eulerimp(f,a,ya,b,n)
  i = 1;
  x(i) = a;
  y(i) = ya;
  h = (b-a)/n;
  ho2 = 0.5*h;
  while (i<=n)
    k1 = y(i) + ho2*f(x(i),y(i));
    y(i+1) = y(i) + h*f(x(i)+ho2,k1);
    x(i+1) = a + (b-a)*i/n;
    i = i+1;
  end%while
end%function
