%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin           15 January 2014 %
% Purpose: Create a Newton Fractal for any function %
%       whose roots are known (up to 12 of them)    %
% INPUT: function f; its derivative fp; a list of   %
%	roots of f; real lower bound r0; real upper %
%	bound r1; imaginary center im; size of      %
%	image to create (will be multiplied by 8).  %
% OUTPUT: matrix of roots found; fractal image.     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function res = newtonFractal(f,fp,roots,r0,r1,im,sz)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create a grid of complex numbers (initial
% approximations to try)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p0 = complexGrid(r0,r1,im,sz);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run Newton's Method for each p0 in the grid
% and match results with list of roots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c=[];
maxits=40;
for i=1:columns(p0)
  for j=1:rows(p0)
    [z,k]=newton(f,fp,p0(j,i),10^-7,maxits);
    color=findIndex(z, roots, 10^-4);
    if (color>length(roots))
      c(j,i)=20*length(roots)+1;
    else
      c(j,i)=20*(color-1)+ceil(20*k/maxits);
    end%if
  end%for
end%for
res = c;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Give each root its own color (up to 12 roots)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
map=colorMapGraded(length(roots));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Display fractal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imshow(res,map);
imwrite(res,map,"newtonFractal.png");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end%function