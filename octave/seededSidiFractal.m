%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin           13 January 2014 %
% Purpose: Create a Seeded Secant Fractal for any   %
%        function whose roots are known (up to 12   %
%        of them)                                   %
% INPUT: function f; a list of roots of f; real     %
%        lower bound r0; real upper bound r1;       %
%        imaginary center im; width sz of image to  %
%        create                                     %
% OUTPUT: matrix of roots found; fractal image      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function res = seededSidiFractal(f,deg,roots,r0,r1,im,sz)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create a grid of complex numbers (initial
% approximations to try)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p0 = complexGrid(r0,r1,im,sz);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run Seeded Secant Method for each p0 in the grid
% and match results with list of roots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c=[];
maxits=40;
for i=1:columns(p0)
  for j=1:rows(p0)
    [z,k]=seededSidi([p0(j,i)],deg,10^-7,maxits,f);
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
imwrite(res,map,"seededSidiFractal.png");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end%function
