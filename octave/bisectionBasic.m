%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Bisection method written by Leon Q. Brin 09 July 2012  %
%  INPUT: Interval [a,b]; function f; tolerance tol; and  %
%         maximum number of iterations maxits.            %
%  OUTPUT: root res to within tol of exact or message of  %
%         failure.                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function res=bisectionBasic(a,b,f,tol,maxits)
  err=b-a;
  L=f(a);
  for i=1:maxits
    m=(a+b)/2;
    M=f(m);
    err=err/2;
    if (M==0 || err<=tol)
      res=m;
      return;
    end%if
    if (L*M<0)
      b=m;
    else
      a=m;
      L=M;
    end%if
  end%for
  res='Method failed. Maximum iterations exceeded.';
end%function
