%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin           3 June 2014 %
% Purpose: Calculation of a natural cubic       %
%        spline.                                %
% INPUT: points (x(1),y(1)), (x(2),y(2)), ...   %
%        spline must interpolate; first         %
%        derivative at left endpoint, m0; first %
%        derivative at right endpoint, mn.      %
% OUTPUT: coefficients of each piece of the     %
%        piecewise cubic spline:                %
%        S(i,x) = a(i)                          %
%          + b(i)*(x-x(i+1))                    %
%          + c(i)*(x-x(i+1))^2                  %
%          + d(i)*(x-x(i+1))^3                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [a,b,c,d] = clampedCubicSpline(x,y,m0,mn)
  n=length(x)-1;
  for i=1:n
    h(i)=x(i)-x(i+1);
  end%for
  % Left endpoint condition:
  % m(1,1)*c(1) + m(1,2)*c(2) = m(1,n+1)
  m(1,1)=3*h(1)+4*h(2); m(1,2)=2*h(2);
  m(1,n+1)=9*(y(1)-y(2))/h(1)-6*(y(2)-y(3))/h(2)-3*m0;
  % Right endpoint condition:
  % m(n,n-1)*c(n-1) + m(n,n)*c(n) = m(n,n+1)
  m(n,n-1)=h(n); m(n,n)=2*h(n); m(n,n+1)=3*((y(n)-y(n+1))/h(n)-mn);
  % Conditions for all splines:
  for i=2:n-1
    m(i,i-1)=h(i);
    m(i,i)=2*(h(i)+h(i+1));
    m(i,i+1)=h(i+1);
    m(i,n+1)=3*((y(i)-y(i+1))/h(i)-(y(i+1)-y(i+2))/h(i+1));
  end%for
  % Solve for c(i)
  l(1)=m(1,1); u(1)=m(1,2)/l(1); z(1)=m(1,n+1)/l(1);
  for i=2:n-1
    l(i)=m(i,i)-m(i,i-1)*u(i-1);
    u(i)=m(i,i+1)/l(i);
    z(i)=(m(i,n+1)-m(i,i-1)*z(i-1))/l(i);
  end%for
  l(n)=m(n,n)-m(n,n-1)*u(n-1);
  c(n)=(m(n,n+1)-m(n,n-1)*z(n-1))/l(n);
  for i=n-1:-1:1
    c(i)=z(i)-u(i)*c(i+1);
  end%for
  % Compute a(i), b(i), d(i)
  % Endpoint conditions:
  b(1)=(y(2)-y(3))/h(2)+2*c(1)*h(2)/3+h(2)*c(2)/3;
  d(1)=(m0-b(1)-2*c(1)*h(1))/(3*h(1)^2);
  % Conditions for all splines:
  a(1)=y(2);
  for i=2:n
    d(i)=(c(i-1)-c(i))/(3*h(i));
    b(i)=(y(i)-y(i+1))/h(i)-(c(i-1)+2*c(i))*h(i)/3;
    a(i)=y(i+1);
  end%for
  b(n)=mn;
end%function