%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                               9 June 2016 %
% Purpose: This function implements a 3rd order Runge-Kutta      %
%        method where the step size is calculated and held       %
%        constant.                                               %
% INPUT: function f(x,y); interval [a,b]; y(a); steps n          %
% OUTPUT: approximation (x(i),y(i)) of the solution of y'=f(x,y) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y,x] = thirdOrder(f,a,ya,b,n)
  i = 1;
  x(i) = a;
  y(i) = ya;
  h = (b-a)/n;
  while (i<=n)
    k1 = f(x(i), y(i));
    k2 = f(x(i)+2*h/7, y(i)+2*h/7*k1);
    k3 = f(x(i)+4*h/7, y(i)+h/35*(-8*k1+28*k2));
    k4 = f(x(i)+6*h/7, y(i)+h/42*(29*k1-28*k2+35*k3));
    y(i+1) = y(i) + h/12*(2*k1+2*k2+5*k3+3*k4);
    x(i+1) = a + (b-a)*i/n;
    i = i+1;
  end%while
end%function
