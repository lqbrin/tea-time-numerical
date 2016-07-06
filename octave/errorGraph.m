N=151;
emin=1e-4;
emax=1e-2;
egol=1e-4;
step=(emax/emin)^(1/(N-1));
x=emin;
y=rk24error(x(1));
for i=2:N
  x(i)=x(i-1)*step;
  y(i)=rk24error(x(i));
endfor

hold off;
loglog(x, y);
hold on;
line([emin emax],[egol egol],"color","green");
line([emin emax],[emin emax],"color","red");
xlim([emin,emax]);
xlabel("tolerance");
ylabel("global error");
title("RK2(4)");