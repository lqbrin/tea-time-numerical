graphics_toolkit ("gnuplot");
f=inline("sin(x)")
rts=[-4*pi,-3*pi,-2*pi,-pi,0,pi,2*pi,3*pi,4*pi];
seededSidiFractal(f,6,rts,-10,10,0,50);
