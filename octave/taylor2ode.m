%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                          13 November 2015 %
% Purpose: This function implements Taylor's method of order 2   %
%        where the step size is calculated and held constant.    %
% INPUT: function f(x,y); function (df/dx)(x,y); interval [a,b]; %
%        y(a); steps n                                           %
% OUTPUT: approximation (x(i),y(i)) of the solution of y'=f(x,y) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [y,x] = taylor2ode(f,ft,a,ya,b,n)
  i = 1;
  x(i) = a;
  y(i) = ya;
  h = (b-a)/n;
  while (i<=n)
    y(i+1) = y(i) + h*(f(x(i),y(i)) + 0.5*h*ft(x(i),y(i)));
    x(i+1) = a + (b-a)*i/n;
    i = i+1;
  end%while
end%function
