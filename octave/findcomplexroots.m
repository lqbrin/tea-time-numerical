%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin           24 January 2014 %
% Purpose: Find roots of a function in the complex  %
%       plane by guess and check using Newton's     %
%       method.                                     %
% INPUT: function f; its derivative fp; a list of   %
%	roots of f; real lower bound r0; real upper %
%	bound r1; imaginary center im; size of      %
%	image to create (will be multiplied by 8).  %
% OUTPUT: matrix of roots found; fractal image.     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function res = findcomplexroots(f,fp,r0,r1,im,sz)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create a grid of complex numbers (initial
% approximations to try)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p0 = complexGrid(r0,r1,im,sz);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run Newton's Method for each p0 in the grid
% and match results with list of roots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
res=[];
count=[];
maxits=20;
for i=1:columns(p0)
  for j=1:rows(p0)
    [z,k]=newton(f,fp,p0(j,i),10^-12,maxits);
    if (k<maxits)
      r=findIndex(z, res, 10^-9);
      if (r>length(res))
        res(r)=z;
        count(r)=1;
      else
        count(r)=count(r)+1;
      end%if
    end%if
  end%for
end%for
disp(count);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end%function