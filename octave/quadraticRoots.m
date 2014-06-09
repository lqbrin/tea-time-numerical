%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                24 January 2012 %
% Purpose: Calculate the roots of the quadratic       %
%        equation ax^2+bx+c=0.                        %
% INPUT: coefficients a, b, and c                     %
% OUTPUT: roots r1 and r2                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [r1,r2] = quadraticRoots(a,b,c)
  d=sqrt(b^2-4*a*c);
  if (b<0)
    r1=(-b+d)/(2*a);
    r2=-2*c/(b-d);
  else
    r1=(-b-d)/(2*a);
    r2=-2*c/(b+d);
  end%if
end%function
