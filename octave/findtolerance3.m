f=inline('(x+2*exp(y)*cos(exp(x)))/(1+exp(y))')
exact=2.37616566485776;
err=10;
a=10^-5;
err=abs(2.37616529319148-exact);
A=10^-4-err
b=10^-3;
err=abs(2.38240728335754-exact);
B=10^-4-err
i=0
while i<20
  m=0.5*(a+b)
  [y,x]=cashkarp(f,0,2,4,.1,m,100000);
  err=abs(y(length(y))-exact)
  M=10^-4-err;
  if M*A<0
    b=m;
  else
    a=m;
    A=M;
  endif
  i=i+1;
end