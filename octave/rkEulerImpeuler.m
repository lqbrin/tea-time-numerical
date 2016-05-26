function adapt = rkEulerImpeuler(f,t0,t1,y0,epsmax,epsmin,exact)
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

  while (sign*h>0)
    k1=f(t,adapt);
    k2=f(t+h,adapt+h*k1);
    eulr=adapt+h*k1;
    trap=adapt+h/2*(k1+k2);
    approxerr=abs((eulr-trap));
    count+=2;
    if (approxerr<=epsmax)
      adapt=trap;
      t=t+h;
      q=(epstarget/approxerr)^(1/2);
    else
      q=qmin;
      sprintf('Step NOT accepted---approxerr too large:')
    end%if
    if (approxerr<epsmin)
      q=qmax;
      sprintf('approxerr too small---increasing q by maximum:')
    end%if
    sprintf('%15.10f%15.10f%15.10f%15.10f%15.10f',t,h,adapt,approxerr,abs(eulr-exact(t)))
    h=h*q;
    if (sign*(t1-t-h)<0)
      h=t1-t;
    end%if
  end%while
  count
end%function