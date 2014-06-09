%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  maxOverMesh() written by Leon Q. Brin 21 January 2013  %
%  INPUT: Interval [a,b]; function f; and number of       %
%         subintervals n.                                 %
%  OUTPUT: maximum value of the function over the end%     %
%         points of the subintervals.                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function ans = maxOverMesh(f,a,b,n)
  ans = f(a);
  for i=1:n
    x = (i*b + (n-i)*a)/n;
    F = f(x);
    if (F>ans) ans = F;
  end%for
end%function