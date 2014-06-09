%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin             1 April 2014 %
% Purpose: Implementation of Sidi's Method         %
% INPUT: function g; initial values x0,x1,...,xk;  %
%        tolerance TOL; maximum number of          %
%        iterations N                              %
% OUTPUT: approximation X and number of iterations %
%        i; or message of failure                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [X,i] = sidi(x, TOL, N, g)
  n=length(x);
  for i=1:n
    G(i,1)=g(x(i));
  end%for
  for j=2:n
    for i=1:n+1-j
      G(i,j)=(G(i+1,j-1)-G(i,j-1))/(x(i+j-1)-x(i));
    end%for
  end%for
  for i=1:N
    s=G(1,n);
    for j=2:n-1
      s=(x(n)-x(j))*s+G(j,n+1-j);
    end%for
    X=x(n)-G(n,1)/s;
    if (abs(X-x(n))<TOL)
      return
    end%if
    G(n+1,1)=g(X);
    for j=n:-1:2
      G(j,n+2-j)=(G(j+1,n+1-j)-G(j,n+1-j))/(X-x(j));
    end%for
    for j=1:n-1
      x(j)=x(j+1);
    end%for
    x(n)=X;
    for j=1:n
      G(n+1-j,j)=G(n+2-j,j);
    end%for
  end%for
  X = "Method failed. Maximum iterations exceeded.";
end%function