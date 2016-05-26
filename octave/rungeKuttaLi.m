f=inline("1/log(x)");
t0=2;
y0=0;
t1=1.01;
eps=.01;

adapt=y0;
t=t0;
hmin=(t1-t0)/4;
h=hmin;
count=0;
while (t>t1)
  if (t+h<t1)
    h=(t1-t);
  end%if
  eulr=adapt;
  trap=adapt;
  clop=adapt;
  k1=f(t,clop);
  k2clop=f(t+h/3,clop+h/3*k1);
  k2trap=f(t+h,trap+h*k1);
  k3clop=f(t+2*h/3,clop+2*h/3*k2clop);
  clop=clop+h/4*(k1+3*k3clop);
  eulr=eulr+h*k1;
  trap=trap+h/2*(k1+k2trap);
  approxerr=abs(eulr-trap);
%  approxerr=abs(clop-trap);
  count+=4;
  if (approxerr>eps || approxerr<eps/10)
    sprintf('Need to adjust h: %15.10f%15.10f%15.10f%15.10f',t,h,adapt,approxerr)
    eulr=adapt;
    trap=adapt;
    clop=adapt;
    q=(eps/2/approxerr)^(1/2);
    h=h*q;
    if (t+h<t1)
      h=(t1-t);
    end%if
    k1=f(t,clop);
    k2clop=f(t+h/3,clop+h/3*k1);
    k2trap=f(t+h,trap+h*k1);
    k3clop=f(t+2*h/3,clop+2*h/3*k2clop);
    clop=clop+h/4*(k1+3*k3clop);
    eulr=eulr+h*k1;
    trap=trap+h/2*(k1+k2trap);
    approxerr=abs(eulr-trap);
%    approxerr=abs(clop-trap);
    count+=4;
  end%if
  adapt=trap;
%  adapt=clop;
  t=t+h;
  sprintf('%15.10f%15.10f%15.10f%15.10f',t,h,adapt,approxerr)
end%while
count