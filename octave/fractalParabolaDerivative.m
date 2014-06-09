function [y,x] = fractalParabolaDerivative(x,f,alpha,d1,d2)
  f1=f(1)*(1-d1);
  c1=f(2)-d1*f(3)-f1;
  f2=f(2)-d2*f(1);
  c2=(1-d2)*f(3)-f2;
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
  for i=its:-1:1
    if (a(i)==0)
      y=c1/alpha+d1*y/alpha;
      x=alpha*x;
    else
      y=(c2+d2*y)/(1-alpha);
      x=alpha+(1-alpha)*x;
    end%if
  end%for
end%function
