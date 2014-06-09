%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                           22 March 2014 %
% Purpose: This function implements Neville's method for       %
%        computing the value P(xhat) of the interpolating      %
%        polynomial P passing through the data (x(1),y(1)),    %
%        (x(2),y(2)),...,(x(n),y(n)).                          %
% INPUT: value xhat; array x of abscissas; array y of          %
%        ordinates.                                            %
% OUTPUT: table of values Q; Q(1,n)=P(xhat).                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Q = nevilles(xhat,x,y)
  n=length(x);
  for i=1:n
    Q(i,1)=y(i);
  end%for
  for j=2:n
    for i=1:n+1-j
      Q(i,j)=((xhat-x(i+j-1))*Q(i,j-1)-(xhat-x(i))*Q(i+1,j-1))/(x(i)-x(i+j-1));
    end%for
  end%for
end%function
