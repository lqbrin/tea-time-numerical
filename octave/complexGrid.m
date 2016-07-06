%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin        18 February 2012 %
% INPUT: real numbers r0<r1; real number im about %
%	which to center the imaginary numbers in        %
%	the grid; size of grid n (usually 1-50).        %
% OUTPUT: a grid of complex numbers with          %
% 	real parts from r0 to r1 and                  %
% 	imaginary parts from im-delta to im+delta     %
% 	calculated to maintain aspect ratio.          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function res = complexGrid(r0,r1,im,n)
  w=8*n;
  h=ceil(3*w/4);
  i0=im-3*(r1-r0)/8;
  i1=im+3*(r1-r0)/8;
  dr=(r1-r0)/(w-1);
  di=(i1-i0)/(h-1);
  res=[];
  for i=1:w
    for j=1:h
      res(j,i)=r0+(i-1)*dr + I*(i1-(j-1)*di);
    end%for
  end%for
end%function