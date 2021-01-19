%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                           11 January 2021 %
% Purpose: This function implements the bisection method where   %
%        the number of iterations is calculated, not supplied as %
%        an argument                                             %
% INPUT: interval [a,b]; function f; tolerance tol               %
% OUTPUT: approximation m; f(m), M; number of iterations i       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [m,M,i]=bisection(a,b,f,tol)
  N=ceil((log(b-a)-log(tol))/log(2));
  L=f(a);
  for i=1:N
    m=(a+b)/2;
    M=f(m);
    if (M==0)
      return;
    end%if
    if (L*M<0)
      b=m;
    else
      a=m;
      L=M;
    end%if
  end%for
  i=N;
end%function
