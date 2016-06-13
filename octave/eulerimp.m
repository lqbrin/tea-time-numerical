%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                               31 May 2016 %
% Purpose: This function implements improved Euler's method      %
%        where the step size is calculated and held constant.    %
% INPUT: function f(x,y); interval [a,b]; y(a); steps n          %
% OUTPUT: approximation (x(i),y(i)) of the solution of y'=f(x,y) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y,x] = eulerimp(f,a,ya,b,n)
  i = 1;
  x(i) = a;
  y(i) = ya;
  h = (b-a)/n;
  while (i<=n)
    k1 = f(x(i),y(i));
    k2 = f(x(i)+h,y(i) + h*k1);
    y(i+1) = y(i) + h/2*(k1+k2);
    x(i+1) = a + (b-a)*i/n;
    i = i+1;
  end%while
end%function
