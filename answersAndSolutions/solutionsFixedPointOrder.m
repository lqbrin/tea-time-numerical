n=[0,1,2,4,6,10];
f=inline('(2^(2^x)-2)/(2^(2^x)+3)');
i=1;
while (i<7)
  disp(f(n(i)));
  i=i+1;
end%while

disp("Break")

n=[0,1,2,4,6,10];
f=inline('(1-2*2^-(2^x))/(1+3*2^-(2^x))');
i=1;
while (i<7)
  disp(f(n(i)));
  i=i+1;
end%while

disp("Break")

f=inline('2-exp(x)+x^2');
p0=1/2
p1=f(p0)
for i=1:5
  p2=f(p1)
  a=p0-(p1-p0)^2/(p2-2*p1+p0)
  p0=p1;
  p1=p2;
end%for

disp("Break")

f=inline('(x+1)/(x-1)');
p0=f(2)
p1=f(3)
for i=4:6
  p2=f(i)
  a=p0-(p1-p0)^2/(p2-2*p1+p0)
  p0=p1;
  p1=p2;
end%for

