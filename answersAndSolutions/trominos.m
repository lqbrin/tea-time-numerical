%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  trominos() written by Leon Q. Brin 14 February 2013  %
%       is a recursively defined function for           %
%       calculating the number of trominos needed to    %
%       cover an n X n grid of squares, save one corner %
%  INPUT: nonnegative integer n.                        %
%  OUTPUT: T(n)                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function ans = trominos(n)
  if (n==0)
    ans = 0;
  else
    ans = 1+4*trominos(n-1);
  end%if
end%function 
