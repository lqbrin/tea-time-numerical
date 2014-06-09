%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  hanoi() written by Leon Q. Brin 14 February 2013     %
%       is a recursively defined function for           %
%       calculating the number of moves needed to       %
%       complete the Tower of Hanoi with n disks.       %
%  INPUT: posititive integer n.                         %
%  OUTPUT: H(n)                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function ans = hanoi(n)
  if (n==1)
    ans = 1;
  else
    ans = 1+2*hanoi(n-1);
  end%if
end%function 
