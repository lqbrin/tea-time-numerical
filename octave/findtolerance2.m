f=inline('(x^2+y)/(x-y^2)');
exact=3.66756912377686;
err=10;
a=10^-5;
err=abs(3.66757677104982-exact);
A=10^-4-err
b=10^-3;
err=abs(3.66822264690948-exact);
B=10^-4-err
i=0
while i<24
  m=0.5*(a+b);
  [y,x]=rk23(f,0,5,3,.1,m,1000);
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