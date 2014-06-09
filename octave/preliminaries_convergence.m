factorial(1)
factorial(2)
factorial(3)
factorial(4)
factorial(5)
factorial(6)
factorial(7)
factorial(8)
factorial(9)
factorial(10)
factorial(11)
factorial(12)

for j=1:12
  factorial(j)
end%for

errs = [2.817*10^(-1), 1.03*10^(-1), 2.022*10^(-2), 1.451*10^(-3), ...
     2.046*10^(-5), 2.07*10^(-8), 2.953*10^(-13), 4.263*10^(-21), ...
     8.777*10^(-34), 2.608*10^(-54), 1.595*10^(-87)];
for j=1:9
  alpha = log(errs(j+2)/errs(j+1))/log(errs(j+1)/errs(j))
end%for

errs = [2.817*10^(-1), 1.03*10^(-1), 2.022*10^(-2), 1.451*10^(-3), ...
     2.046*10^(-5), 2.07*10^(-8), 2.953*10^(-13), 4.263*10^(-21), ...
     8.777*10^(-34), 2.608*10^(-54), 1.595*10^(-87)];

d = inline('-log(x/exp(1))/log(10)')
for j=1:9
  T(j,1) = log(errs(j+2)/errs(j+1))/log(errs(j+1)/errs(j));	% alpha
  T(j,2) = errs(j+2)/errs(j+1)^T(j,1);			   	% lambda
  T(j,3) = d(errs(j+2));						% d (explicit)
end%for

alpha = 1.61804;
lambda = 0.8;
constant = log(lambda*exp(alpha-1))/log(10);
T(1,4) = T(1,3);
for j=2:9
  T(j,4) = alpha * T(j-1,4) - constant;				% d (recursive)
end%for

disp('      alpha     lambda   d (expl)    d (rec)');
disp('  --------------------------------------------');
disp(T)

disp('')
for j=0:9
  disp(7^j)
end%for

disp('')
f=inline('(2^(2^x)-2)/(2^(2^x)+3)');
n=[0,1,2,4,6,10];
for i=1:6
  disp(f(n(i)))
end%for
