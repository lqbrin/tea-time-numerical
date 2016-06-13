function err = rk34error(tol)
  f=inline('(x+2*exp(y)*cos(exp(x)))/(1+exp(y))');
  exact=2.37616566485;
  x0=0;
  y0=2;
  x1=4;
  h0=1/10;
  f=inline('log(x+y)');
  exact=0.87515724152;
  x0=0;
  y0=1/2;
  x1=2;
  h0=1/10;
  [y,x,ev]=rk34butcher(f,x0,y0,x1,h0,tol,100000);
  err=abs(exact-y(length(y)));
end%function