%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                           14 November 2015 %
% Purpose: This function implements Taylor's method of order 2    %
%        where the step size is calculated and held constant.     %
% INPUT: function f(x,y); functions (df/dx)(x,y), (d2f/dx2)(x,y); %
%        interval [a,b]; y(a); steps n                            %
% OUTPUT: approximation (x(i),y(i)) of the solution of y'=f(x,y)  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [y,x] = taylor3ode(f,ft,ftt,a,ya,b,n)
  i = 1;
  x(i) = a;
  y(i) = ya;
  h = (b-a)/n;
  while (i<=n)
    y(i+1) = y(i) + h*(f(x(i),y(i)) + h*(0.5*ft(x(i),y(i)) + h*ftt(x(i),y(i))/6));
    x(i+1) = a + (b-a)*i/n;
    i = i+1;
  end%while
end%function
