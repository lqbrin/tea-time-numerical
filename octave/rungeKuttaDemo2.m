t=4;
h=-1/4;
f=inline("-y/t+t^2");
exact=inline("t^3/4+16/t");
simp=20;
open=20;
clop=20;
disp('        Simpsons  Open      Clopen    Simp err  Open err  Clop err')
disp('        ------------------------------------------------------------')
for i=1:8
  k1simp=f(t,simp);
  k1open=f(t,open);
  k1clop=f(t,clop);
  k2simp=f(t+h/2,simp+h/2*k1simp);
  k2open=f(t+h/3,open+h/3*k1open);
  k2clop=f(t+h/3,clop+h/3*k1clop);
  k3simp=f(t+h,simp+h*k2simp);
  k3open=f(t+2*h/3,open+2*h/3*k2open);
  k3clop=f(t+2*h/3,clop+2*h/3*k2clop);
  simp=simp+h/6*(k1simp+4*k2simp+k3simp);
  open=open+h/2*(k2open+k3open);
  clop=clop+h/4*(k1clop+3*k3clop);
  t=t+h;
  x=exact(t);
  sierr=abs(simp-x);
  operr=abs(open-x);
  clerr=abs(clop-x);
  sprintf('%10.5f%10.5f%10.5f%10.5f%10.5f%10.5f',simp,open,clop,sierr,operr,clerr)
end%for