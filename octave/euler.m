%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                           29 January 2012 %
% Purpose: This function implements Euler's method where the     %
%        step size is calculated and held constant.              %
% INPUT: function f(x,y); interval [a,b]; y(a); steps n          %
% OUTPUT: approximation (x(i),y(i)) of the solution of y'=f(x,y) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y,x] = euler(f,a,ya,b,n)
  i = 1;
  x(i) = a;
  y(i) = ya;
  h = (b-a)/n;
  while (i<=n)
    y(i+1) = y(i) + h*f(x(i),y(i));
    x(i+1) = a + (b-a)*i/n;
    i = i+1;
  end%while
end%function
