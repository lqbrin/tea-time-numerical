%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin              16 May 2014 %
% Purpose: Implementation of Romberg integration   %
% INPUT: function f, interval endpoints a and b,   %
%        tolerance tol                             %
% OUTPUT: approximate integral of f(x) from a to b %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function integral = romberg(f,a,b,tol)
  N(1,1)=compositeTrapezoidal(f,a,b,1);
  N(2,1)=compositeTrapezoidal(f,a,b,2);
  N(2,2)=(4*N(2,1)-N(1,1))/3;
  i=2;
  while (abs(N(i,i)-N(i,i-1))>tol || abs(N(i,i)-N(i-1,i-1))>tol)
    i=i+1;
    N(i,1)=compositeTrapezoidal(f,a,b,2^(i-1));
    for j=2:i
      m=4^(j-1);
      N(i,j)=(m*N(i,j-1)-N(i-1,j-1))/(m-1);
    end%for
  end%while
  integral=N(i,i);
end%function