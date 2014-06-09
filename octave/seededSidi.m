%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin             1 April 2014 %
% Purpose: Implementation of Sidi's Method         %
% INPUT: function g; initial values x0,x1,...,xk;  %
%        tolerance TOL; maximum number of          %
%        iterations N                              %
% OUTPUT: approximation X and number of iterations %
%        i; or message of failure                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [X,i] = seededSidi(x, k, TOL, N, g)
  % Compute divided differences for array x
  n=length(x);
  for i=1:n
    G(i,1)=g(x(i));
  end%for
  for j=2:n
    for i=1:n+1-j
      G(i,j)=(G(i+1,j-1)-G(i,j-1))/(x(i+j-1)-x(i));
    end%for
  end%for
  % If only one initial value, use fixed pt iteration to calculate a second
  if (n==1)
    X=x(1)+g(x(1));
    if (abs(X-x(n))<TOL)
      return
    end%if
    x(2)=X;
    % Add diagonal to divided differences table
    G(2,1)=g(x(2));
    G(1,2)=(G(2,1)-G(1,1))/(x(2)-x(1));
    n=2;
  end%if
  % Use Sidi's Method to calculate additional initial values until we have k of them
  for i=n+1:k
    s=G(1,n);
    for j=2:n-1
      s=(x(n)-x(j))*s+G(j,n+1-j);
    end%for
    X=x(n)-G(n,1)/s;
    if (abs(X-x(n))<TOL)
      return
    end%if
    x(i)=X;
    % Add diagonal to divided differences table
    n=n+1;
    G(i,1)=g(x(i));
    for j=i-1:-1:1
      G(j,n-j+1)=(G(j+1,n-j)-G(j,n-j))/(x(i)-x(j));
    end%for
  end%for
  % Execute Sidi's Method to find a root
  for i=k+1:N
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