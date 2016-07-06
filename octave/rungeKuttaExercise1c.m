t0=4;
h=-1/4;
n=8;
f=inline("-y/t+t^2");
exact=inline("t^3/4+16/t");
y0=20;
disp('                 y       Exact       Error')
disp('      ------------------------------------')
for j=1:6
  t=t0;
  y=y0;
  for i=1:n
    k1=f(t,y);
    k2=f(t+h/3,y+h/3*k1);
    y=y+h/2*(3*k2-k1);
    t=t+h;
  end%for
  x=exact(t);
  sprintf('%12.5g%12.5g%12.5g',y,x,abs(y-x))
  n=n*2;
  h=h/2;
end%for