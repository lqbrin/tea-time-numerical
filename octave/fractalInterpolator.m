%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Dr. Len Brin               19 February 2014 %
% Purpose: Calculate values of the fractal interpolating %
%        function, f, passing through                    %
%        (0,f_0), (alpha,f_alpha), and (1,f_1),          %
%        its derivative and its integral.                %
% INPUT: value at which to evaluate, x; array of values, %
%        f = [f_0,f_alpha,f_1]; alpha; scaling factors   %
%        d1 and d2.                                      %
% OUTPUT: y=f'(x); yy=f(x); yyy=F(x).                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y,yy,yyy] = fractalInterpolator(x,f,alpha,d1,d2)
  f1=f(1)*(1-d1);
  c1=f(2)-d1*f(3)-f1;
  f2=f(2)-d2*f(1);
  c2=(1-d2)*f(3)-f2;
  F1=(alpha*(f1+c1/2)+(1-alpha)*(f2+c2/2))/(1-(1-alpha)*d2-alpha*d1);
  FA=alpha*(f1+c1/2+d1*F1);
  l=0;
  r=1;
  a=[];
  if (alpha>1/2)
    its=floor(log(10^-16)/log(alpha));
  else
    its=floor(log(10^-16)/log(1-alpha));
  end%if
  for i=1:its
    if (alpha>1/2)
      h = (r-l)*alpha;
      m = l+h;
    else
      h = (r-l)*(1-alpha);
      m = r-h;
    end%if
    if (x<m)
      a(i)=0;
      r=m;
    else
      a(i)=1;
      l=m;
    end%if
  end%for
  x=0;
  y=c1/(alpha-d1);
  yy=f(1);
  yyy=0;
  for i=its:-1:1
    if (a(i)==0)
      y=(c1+d1*y)/alpha;
      yy=c1*x+d1*yy+f1;
      yyy=alpha*(f1*x+c1/2*x*x+d1*yyy);
      x=alpha*x;
    else
      y=(c2+d2*y)/(1-alpha);
      yy=c2*x+d2*yy+f2;
      yyy=FA+(1-alpha)*(f2*x+c2/2*x*x+d2*yyy);
      x=alpha+(1-alpha)*x;
    end%if
  end%for
end%function
