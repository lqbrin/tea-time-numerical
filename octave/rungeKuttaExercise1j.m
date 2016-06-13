t0=4;
h=-1/4;
n=8;
f=inline("-y/t+t^2");
exact=inline("t^3/4+16/t");
y0=20;
disp('                 h           y       Error')
disp('      ------------------------------------')
for j=1:6
  t=t0;
  y=y0;
  for i=1:n
    k1=f(t,y);
    alpha=(sqrt(5)-sqrt(3))/(2*sqrt(5));
    k2=f(t+alpha*h,y+alpha*h*k1);
    k3=f(t+h/2,y+h/2*k2);
    alpha=(sqrt(5)+sqrt(3))/(2*sqrt(5));
    k4=f(t+alpha*h,y+alpha*h*k3);
    y=y+h/18*(5*k2+8*k3+5*k4);
    t=t+h;
  end%for
  x=exact(t);
  sprintf('%12.5g%12.5g%12.5g',h,y,abs(y-x))
  n=n*2;
  h=h/2;
end%for