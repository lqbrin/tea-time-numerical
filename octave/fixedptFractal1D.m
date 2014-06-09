%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin            9 January 2014 %
% Purpose: Create a fixed point 1-D (real line)     %
% fractal for any function whose roots are known    %
% (up to 12 of them)                                %
% INPUT: function f; a list of roots of f; real     %
%       lower bound r0; real upper bound r1; size   %
%       of image to create (number of pixels wide)  %
% OUTPUT: matrix of roots found; fractal image      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function res = fixedptFractal1D(f,roots,r0,r1,sz)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run Newton's Method for each p0 in the grid
% and match results with list of roots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c=[];
% Draw fractal
step=(r1-r0)/(sz-1);
for i=1:sz
  z=fixedPointIteration(f,r0+(i-1)*step,10e-6,100);
  c(1,i)=findIndex(z, roots, 10^-3);
end % for
c(2,1)=4;
c(3,1)=4;
% Draw tic marks
res = c;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Give each root its own color (up to 12 roots)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
map=colorMap(length(roots));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Display fractal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
image(res), colormap(map), axis off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end % function