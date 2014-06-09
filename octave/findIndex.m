%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin          18 February 2012 %
% INPUT: number r; list of numbers l; tolerance tol %
% OUTPUT: index of number r, within tolerance tol,  %
%         in list l; or one more than length of l   %
%         if r is not found                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function res = findIndex(r,l,tol)
  for res=1:length(l)
    if (abs(r-l(res))<tol)
      return
    end%if
  end%for
  res=length(l)+1;
end%function