%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                               28 May 2016 %
% Purpose: This function implements Ralston's method where       %
%        the step size is calculated and held constant.          %
% INPUT: function f(x,y); interval [a,b]; y(a); steps n          %
% OUTPUT: approximation (x(i),y(i)) of the solution of y'=f(x,y) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y,x] = ralston(f,a,ya,b,n)
  i = 1;
  x(i) = a;
  y(i) = ya;
  h = (b-a)/n;
  while (i<=n)
    k1 = f(x(i),y(i));
    k2 = f(x(i)+2*h/3,y(i)+2*h/3*k1);
    y(i+1) = y(i) + h/4*(k1+3*k2);
    x(i+1) = a + (b-a)*i/n;
    i = i+1;
  end%while
end%function
