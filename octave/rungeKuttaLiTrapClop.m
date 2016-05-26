f=inline("1/log(x)");
%f=inline("exp(-x^2)");
f=inline("log(x)");
t0=2;
y0=0;
t1=1.01;
t1=10;
eps=.0001;
sign=1;
if (t1<t0)
  sign=-1;
end%if

adapt=y0;
t=t0;
h=(t1-t0)/10;
count=0;
while (sign*(t1-t)>0)
  if (sign*(t+h-t1)>0)
    h=(t1-t);
  end%if
  k1=f(t,adapt);
  k2clop=f(t+h/3,adapt+h/3*k1);
  k2trap=f(t+h,adapt+h*k1);
  k3clop=f(t+2*h/3,adapt+2*h/3*k2clop);
  clop=adapt+h/4*(k1+3*k3clop);
  trap=adapt+h/2*(k1+k2trap);
  approxerr=abs(clop-trap);
  count+=4;
  if (approxerr>eps || approxerr<eps/4)
    sprintf('Need to adjust h: %15.10f%15.10f%15.10f%15.10f',t,h,adapt,approxerr)
    q=(eps/2/approxerr)^(1/3);
    h=h*q;
    if (sign*(t+h-t1)>0)
      h=(t1-t);
    end%if
    k2clop=f(t+h/3,adapt+h/3*k1);
    k2trap=f(t+h,adapt+h*k1);
    k3clop=f(t+2*h/3,adapt+2*h/3*k2clop);
    clop=adapt+h/4*(k1+3*k3clop);
    trap=adapt+h/2*(k1+k2trap);
    approxerr=abs(clop-trap);
    count+=3;
  end%if
  adapt=clop;
  t=t+h;
  sprintf('%15.10f%15.10f%15.10f%15.10f',t,h,adapt,approxerr)
end%while
count