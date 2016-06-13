f=inline('log(x+y)');
exact=0.875157241522361;
err=10;
a=10^-5;
err=abs(0.875128509223059-exact);
A=10^-4-err
b=10^-4;
err=abs(0.874950356963743-exact);
B=10^-4-err
i=0
while i<20
  m=0.5*(a+b);
  [y,x]=rk23(f,0,.5,2,.1,m,1000);
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