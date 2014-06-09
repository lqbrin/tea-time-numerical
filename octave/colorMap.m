%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin         18 February 2012 %
% INPUT: number of colors besides black, n.        %
% OUTPUT: a list of n+1 colors with black the last %
%         (up to 12 colors other than black)       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function res = colorMap(n)

  cm=[];
  cm(1,1:3) =[1 0 0];  cm(2,1:3) =[0 1 0];  cm(3,1:3) =[0 0 1];
  cm(4,1:3) =[0 1 1];  cm(5,1:3) =[1 0 1];  cm(6,1:3) =[1 1 0];
  cm(7,1:3) =[0 .5 1]; cm(8,1:3) =[.5 1 0]; cm(9,1:3) =[1 0 .5];
  cm(10,1:3)=[0 1 .5]; cm(11,1:3)=[.5 0 1]; cm(12,1:3)=[1 .5 0];

  res=cm(1:n,1:3);
  res(n+1,1:3)=[0 0 0];

end%function
