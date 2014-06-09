%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                           30 March 2014 %
% Purpose: This function calculates Sidi's formula from the    %
%        associated divided differences table.                 %
% INPUT: array x of approximations; array d of values on the   %
%        diagonal of the divided differences table; function f %
% OUTPUT: next approximation in Sidi's Method.                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function xnew = sidiMethod(x,d,f)
  n=length(x);
  s=d(1);
  for i=2:n-1
    s=(x(n)-x(i))*s+d(i);
  end%for
  xnew = x(n)-d(n)/s;
end%function