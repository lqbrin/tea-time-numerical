%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin           15 January 2014 %
% Purpose: Create a Secant Fractal for any function %
%       whose roots are known (up to 12 of them)    %
% INPUT: function f; a list of                      %
%	roots of f; real lower bound r0; real upper %
%	bound r1; imaginary center im; size of      %
%	image to create (will be multiplied by 8).  %
% OUTPUT: matrix of roots found; fractal image.     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function res = secantFractalAnyRectangle(f,roots,r0,r1,i0,i1,sz)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create a grid of complex numbers (initial
% approximations to try)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p0 = complexGridAnyRectangle(r0,r1,(i1+i0)/2,(i1-i0)/(r1-r0),sz);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run Secant Method for each p0 in the grid
% and match results with list of roots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c=[];
maxits=60;
for i=1:columns(p0)
  for j=1:rows(p0)
    [z,k]=secant(f,p0(j,i),p0(j,i)+.001,10^-7,maxits);
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
imwrite(res,map,"secantFractal.png");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end%function