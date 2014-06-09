%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                           30 March 2014 %
% Purpose: This function calculates one step of Sidi's Method  %
%        of degree k.                                          %
% INPUT: array x of k+1 approximations; array d of k+1 values  %
%        from the diagonal of the divided differences table;   %
%        function f.                                           %
% OUTPUT: array xnew of k+1 approximations; array diag of k+1  %
%        values from the diagonal of the divided differences   %
%        table; each incremented one iteration beyond x and d. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [xnew,diag] = sidiStep(x,d,f)
  n=length(x);
  xnew(n)=sidiMethod(x,d,f);
  for i=n-1:-1:1
    xnew(i)=x(i+1);
  end%for
  diag(n)=f(xnew(n));
  for i=n-1:-1:1
    diag(i)=(diag(i+1)-d(i+1))/(xnew(n)-xnew(i));
  end%for
end%function