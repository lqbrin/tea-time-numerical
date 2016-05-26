function adapt = rkImpeulerHeun(f,t0,t1,y0,epsmax,epsmin,exact)
  adapt=y0;
  t=t0;
  h=(t1-t0)/10;
  sign=1;
  if (h<0)
    sign=-1;
  end%if
  count=0;
  epstarget=sqrt(epsmin*epsmax)
  qmax=(epsmax/epsmin)^(1/2);
  qmin=1/qmax;
  lasterr=0;

  while (sign*h>0)
    k1=f(t,adapt);
    k2clop=f(t+h/3,adapt+h/3*k1);
    k2trap=f(t+h,adapt+h*k1);
    k3clop=f(t+2*h/3,adapt+2*h/3*k2clop);
    clop=adapt+h/4*(k1+3*k3clop);
    trap=adapt+h/2*(k1+k2trap);
    approxerr=abs((clop-trap)/h);
    count+=4;
    if (approxerr<=epsmax)
      adapt=trap;
      t=t+h;
      q=(epstarget/approxerr)^(1/3);
    else
      q=qmin;
      sprintf('Step NOT accepted---approxerr too large:')
    end%if
    if (approxerr<epsmin)
      q=qmax;
      sprintf('approxerr too small---increasing q by maximum:')
    end%if
    newerr=abs(trap-exact(t));
    sprintf('%15.10f%15.10f%15.10f%15.10f%15.10f',t,h,adapt,approxerr,abs(newerr-lasterr))
    lasterr=newerr;
    h=h*q;
    if (sign*(t1-t-h)<0)
      h=t1-t;
    end%if
  end%while
  count
end%function