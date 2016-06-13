n=150;
a=10^-4;
b=10^-2;
h=(b/a)^(1/n);
x=0;
y=0;
tol=a;
for i=1:1:n
x(i)=tol;
y(i)=rk24error(tol);
tol=tol*h;
end

loglog(x,y);
hold;
title("RK2(4)");
loglog(a:b-a:b,a:b-a:b,'color','r');
avg=sqrt(a*b);
avg=1e-4
loglog([a b],[avg avg],'color','g');
xlabel("tolerance");
ylabel("global error");
hold