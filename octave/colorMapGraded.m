%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin         18 February 2012 %
% INPUT: number of colors besides black, n.        %
% OUTPUT: a list of n+1 colors with black the last %
%         (up to 12 colors other than black)       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function res = colorMapGraded(n)

  cm=[];
  for i=0:19 % Shades of red
    cm(i+1,1:3) =[1-i/20 0 0];
  end%for
  for i=0:19 % Shades of green
    cm(i+21,1:3)=[0 1-i/20 0];
  end%for
  for i=0:19 % Shades of blue
    cm(i+41,1:3)=[0 0 1-i/20];
  end%for
  for i=0:19 % Shades of cyan
    cm(i+61,1:3)=[0 1-i/20 1-i/20];
  end%for
  for i=0:19 % Shades of magenta
    cm(i+81,1:3)=[1-i/20 0 1-i/20];
  end%for
  for i=0:19 % Shades of yellow
    cm(i+101,1:3)=[1-i/20 1-i/20 0];
  end%for
  for i=0:19 % Shades of ???
    cm(i+121,1:3)=[1-i/60 1-i/40 1-i/20];
  end%for
  for i=0:19 % Shades of ???
    cm(i+141,1:3)=[1-i/60 1-i/20 1-i/40];
  end%for
  for i=0:19 % Shades of ???
    cm(i+161,1:3)=[1-i/20 1-i/60 1-i/40];
  end%for
  for i=0:19 % Shades of ???
    cm(i+181,1:3)=[1-i/40 1-i/60 1-i/20];
  end%for
  for i=0:19 % Shades of ???
    cm(i+201,1:3)=[1-i/40 1-i/20 1-i/60];
  end%for
  for i=0:19 % Shades of ???
    cm(i+221,1:3)=[1-i/20 1-i/40 1-i/60];
  end%for

  res=cm(1:20*n,1:3);
  res(20*n+1,1:3)=[0 0 0];

end%function
