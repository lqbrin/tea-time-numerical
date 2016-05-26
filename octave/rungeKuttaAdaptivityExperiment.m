n=8;
f=inline("-y/t+t^2");
exact=inline("t^3/4+16/t");
disp('        h           Eulr-Trap   Eulr Error  Ratio       Trap Error  Trap-Clop   Clop Error  Ratio       Open Error  Open-Clop   Ratio')
disp('        ------------------------------------------------------------------------------------------------------------------------------------')
lasteulrmtrap=0;
lasttrapmclop=0;
lastopenmclop=0;
for j=1:12
  h=-2/n;
  t=4;
  eulr=20;
  trap=20;
  simp=20;
  open=20;
  clop=20;
  for i=1:1
    k1eulr=f(t,eulr);
    eulr=eulr+h*k1eulr;

    k1trap=f(t,trap);
    k2trap=f(t+h,trap+h*k1trap);
    trap=trap+h/2*(k1trap+k2trap);

    k1open=f(t,open);
    k2open=f(t+h/3,open+h/3*k1open);
    k3open=f(t+2*h/3,open+2*h/3*k2open);
    open=open+h/2*(k2open+k3open);

    k1clop=f(t,clop);
    k2clop=f(t+h/3,clop+h/3*k1clop);
    k3clop=f(t+2*h/3,clop+2*h/3*k2clop);
    clop=clop+h/4*(k1clop+3*k3clop);

    k1simp=f(t,simp);
    k2simp=f(t+h/2,simp+h/2*k1simp);
    k3simp=f(t+h,simp+h*k2simp);
    simp=simp+h/6*(k1simp+4*k2simp+k3simp);

    t=t+h;
  end%for
  y=exact(t);
  eulrmtrap=abs(eulr-trap);
  trapmclop=abs(trap-clop);
  openmclop=abs(open-clop);
  erreulr=abs(y-eulr);
  erropen=abs(y-open);
  errclop=abs(y-clop);
  errtrap=abs(y-trap);
  sprintf('%12.5g%12.5g%12.5g%12.5g%12.5g%12.5g%12.5g%12.5g%12.5g%12.5g%12.5g',h,abs(eulr-trap),erreulr,lasteulrmtrap/eulrmtrap,errtrap,abs(trap-clop),errclop,lasttrapmclop/trapmclop,erropen,abs(open-clop),lastopenmclop/openmclop)
  lasteulrmtrap=eulrmtrap;
  lasttrapmclop=trapmclop;
  lastopenmclop=openmclop;
  n=2*n;
end%for