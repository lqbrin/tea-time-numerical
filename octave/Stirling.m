%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Stirling() written by Leon Q. Brin 22 January 2013             %
%       recursively computes Stirling numbers of the second kind. %
%  INPUT: positive integers n and k, k<=n.                        %
%  OUTPUT: S(n,k), the number of ways to partition a set of n     %
%       elements into k nonempty subsets.                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function ans = Stirling(n,k)
  if (n==k)
    ans = 1;
  else
    if (k==1)
      ans = 1;
    else
      ans = Stirling(n-1,k-1) + k*Stirling(n-1,k);
    end%if
  end%if
end%function
