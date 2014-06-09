format('long');

f=[.123,-.123,.5];
alpha=.33;
d1=.27;
d2=(alpha-d1)*(1-alpha)/alpha;

a=.3;
b=.4;
tol=1e-15;

x=0:1/444:1;
y=[];
for i=1:length(x) y(i)=fractalParabolaDerivative(x(i),f,alpha,d1,d2); end
plot(x,y);

exact=3.300125304146395186013762305097977359773e-1 % from wxmaxima!
disp("");

disp("Secant Method");
x0=.33;
x1=.331;
y0=fractalParabolaDerivative(x0,f,alpha,d1,d2);
for i=1:100
  y1=fractalParabolaDerivative(x1,f,alpha,d1,d2);
  x2=x1-y1*(x1-x0)/(y1-y0);
  if (abs(x2-x1)<tol) break; end%if
  x0=x1;
  x1=x2;
  y0=y1;
end
i
zero=x2
y=fractalParabolaDerivative(zero,f,alpha,d1,d2)
error=zero-exact

disp("");
disp("Bisection Method");
x0=a;
x1=b;
y0=fractalParabolaDerivative(x0,f,alpha,d1,d2);
its=ceil(log(tol/(x1-x0))/log(1/2));
for i=1:its
  m = x0 + (x1-x0)/2;
  ym = fractalParabolaDerivative(m,f,alpha,d1,d2);
  if (y0*ym<0)
    x1=m;
  else
    x0=m;
    y0=ym;
  end
end
i
zero=m
y=fractalParabolaDerivative(zero,f,alpha,d1,d2)
error=zero-exact

disp("");
disp("Newton's Method");
x0=a;
for i=1:100
  x=x0-fractalParabola(x0,f,alpha,d1,d2)/fractalParabolaDerivative(x0,f,alpha,d1,d2);
  if (abs(x-x0)<tol) break; end%if
  x0=x;
end
i
zero=x
fractalParabola(zero,f,alpha,d1,d2)
