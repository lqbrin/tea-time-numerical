%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  recFactorial() written by Leon Q. Brin 21 January 2013  %
%       is a recursively defined factorial function.       %
%  INPUT: nonnegative integer n.                           %
%  OUTPUT: n!                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function ans = recFactorial(n)
  if (n==0)
    ans = 1;
  else
    ans = n*recFactorial(n-1);
  end%if
end%function 
