graphics_toolkit ("gnuplot");
f=inline("sin(x)")
fp=inline("cos(x)")
rts=[-4*pi,-3*pi,-2*pi,-pi,0,pi,2*pi,3*pi,4*pi];
newtonFractal(f,fp,rts,-10,10,0,50);
