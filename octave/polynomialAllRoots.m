%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin         12 February 2014 %
% Purpose: Find all roots of the polynomial        %
%   p(x) = c1 + c2*x + c3*x^2 + ... + c(n+1)*x^n   %
% INPUT: coefficients c of the polynomial p;       %
%        tolerance tol; maximum iterations N;      %
%        initial value x0                          %
% OUTPUT: array of approximate roots r; or message %
%        of failure                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function r=polynomialAllRoots(c,tol,N,x0)
  deg=length(c)-1;
  m=deg;
  d=[]; r=[];
  for i=1:deg-2
    k=0;
    x=x0;
    while (abs(x-x0)>tol || k==0)
      if (k==N)
        print("Method failed. Not all roots found.")
        return
      end%if
      x0=x;
      d(m)=c(m+1);
      z=c(m+1);
      for j=m:-1:2
        d(j-1)=x0*d(j)+c(j);
        z=x0*z+d(j-1);
      end%for
      y=x0*d(1)+c(1);
      x=x0-y/z;
      k=k+1;
    end%while
    r(i)=x;
    for j=1:m
      c(j)=d(j);
    end%for
    m=m-1;
  end%for
  D=sqrt(c(2)^2-4*c(1)*c(3));
  s1=D-c(2);
  s2=-D-c(2);
  if (real(c(2))<0) 
    r(deg-1)=s1/(2*c(3));
    r(deg)=2*c(1)/s1;
  else
    r(deg-1)=s2/(2*c(3));
    r(deg)=2*c(1)/s2;
  end%if
end%function
