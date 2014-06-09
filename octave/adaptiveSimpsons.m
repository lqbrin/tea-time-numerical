%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                15 May 2014  %
% Purpose: Wrapper for aSimp()                     %
% INPUT: function f, interval endpoints a and b,   %
%        desired accuracy TOL.                     %
% OUTPUT: approximate integral of f(x) from a to b %
%         within TOL of actual.                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function res = adaptiveSimpsons(f,a,b,TOL)
  res = aSimp(f,a,b,f(a),f((a+b)/2),f(b),TOL);
end%function