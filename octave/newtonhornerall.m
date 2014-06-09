%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin          15 January 2014 %
% Purpose: Implementation of Newton's Method       %
%        for polynomials of the form               %
%   p(x) = c1 + c2*x + c3*x^2 + ... + c(n+1)*x^n   %
%        using Horner's Method                     %
% INPUT: coefficients c; tolerance TOL; maximum    %
%        number of iterations N0                   %
% OUTPUT: approximations to all roots, roots       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function roots = newtonhornerall(c,TOL,N0)
  n=length(c)-1;
  if (n==0)
    roots="This is a constant function. No roots found.";
    return
  elseif (n==1)
    roots=-c(1)/c(2);
    return
  end%if
  d=c;
  for i=1:n-2
    x0=unifrnd(-10,10) + I*unifrnd(-10,10);
    res=newtonhorner(d,x0,TOL,N0);
    roots(i)=res;
    x0=roots(i);
    dt=zeros(n-i+1);
    dt(n-i+1)=d(n-i+2);
    for j=1:n-i
      dt(n-i+1-j)=x0*dt(n-i+2-j)+d(n-i+2-j);
    end%for
    d=dt;
  end%for
  [r1,r2]=quadraticRoots(d(3),d(2),d(1));
  roots(n-1)=r1;
  roots(n)=r2;
  for i=2:n
    roots(i)=newtonhorner(c,roots(i),TOL,N0);
  end%for
end%function
