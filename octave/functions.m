f1=inline('3-x-sin(x)');
f1p=inline('-1-cos(x)');
f2=inline('3*x^4-2*x^3-3*x+2');
f2p=inline('12*x^3-6*x^2-3');
f3=inline('10-cosh(x)');
f3p=inline('-sinh(x)');
f4=inline('sqrt(4+5*sin(t))-2.5');
f4p=inline('5*cos(t)/(2*sqrt(4+5*sin(t)))');
f5=inline('(3*t^2*tan(t))/(1-t^2)');
f5p=inline('(6*t*tan(t)+(3*t^2-3*t^4)*sec(t)^2)/(1-t^2)^2');
f6=inline('log(3*sin(t))-3*t/5');
f6p=inline('cot(t)-3/5');
f7=inline('exp(sin(r))-r');
f7p=inline('exp(sin(r))*cos(r)-1');
f8=inline('sin(exp(r))+r');
f8p=inline('cos(exp(r))*exp(r)+1');
f9=inline('2^sin(r)-3^cos(r)');
f9p=inline('log(3)*sin(r)*3^cos(r)+log(2)*cos(r)*2^sin(r)');