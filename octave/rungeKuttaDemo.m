t=4;
h=-1/4;
f=inline("-y/t+t^2");
exact=inline("t^3/4+16/t");
euler=20;
trap=20;
disp('             Euler   Trapezoid       Exact   Euler err    Trap err')
disp('        -------------------------------------------------------------')
for i=1:8
  euler=euler+h*f(t,euler);
  k1=f(t,trap);
  k2=f(t+h,trap+h*k1);
  trap=trap+h/2*(k1+k2);
  t=t+h;
  x=exact(t);
  sprintf('%12.5g%12.5g%12.5g%12.5g%12.5g',euler,trap,x,abs(euler-x),abs(trap-x))
end%for