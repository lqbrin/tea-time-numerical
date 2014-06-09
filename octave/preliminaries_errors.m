disp('Experiment 1')
p1 = 10*pi-31
p2 = 100*p1-41
p3 = 100*p2-59
p4 = 100*p3-26
p5 = 100*p4-53
p6 = 100*p5-58
p7 = 100*p6-97

disp('Experiment 2')
approx = inline('(sin(1-2*h)-8*sin(1-h)+8*sin(1+h)-sin(1+2*h))/(12*h)')
approx = inline('(sin(1+h)-sin(1-h))/(2*h)')
for i=0:8
  a=approx(10^-i);
  e=abs(a-cos(1));
  fprintf('%10g%25.16g%25.16g\n',10^-i,a,e);
end%for

disp('Experiment 3')
f = inline('4*x*(1-x)')
p = 1/7
n=40;
for i=1:n
  p = f(p);
  if (i>n-5) disp(p); end%if
end%for

p=1/7+10^-12
diff=abs(p-1/7)
for i=1:n
  p = f(p);
  if (i>n-5) disp(p); end%if
end%for

disp('')
fprintf('%.30g\n',10/7);
fprintf('%.30g\n',100/7);
fprintf('%.30g\n',1000/7);
fprintf('%.30g\n',10000/7);
fprintf('%.30g\n',100000/7);
fprintf('%.30g\n',1000000/7);
fprintf('%.30g\n',10000000/7);
fprintf('%.30g\n',100000000/7);
fprintf('%.30g\n',1000000000/7);
fprintf('%.30g\n',10000000000/7);
fprintf('%.30g\n',100000000000/7);
fprintf('%.30g\n',1000000000000/7);

abs(22/7-pi)
abs(16525/54-pi^5)/abs(pi^5)
(sin(1.01)-sin(0.99))/0.02
