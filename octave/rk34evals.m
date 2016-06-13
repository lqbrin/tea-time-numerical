function ev = rk34error(tol)
  f=inline('(x+2*exp(y)*cos(exp(x)))/(1+exp(y))');
  exact=2.37616566485776;
  [y,x,ev]=rk34(f,0,2,4,.4,tol,100000);
  err=abs(exact-y(length(y)));
end%function