graphics_toolkit ("gnuplot");
f=inline("log(x)*(x^3+1)")
fp=inline("3*x^2*log(x)+(x^3+1)/x")
rts=[1, -1, .5+sqrt(3)/2*i, .5-sqrt(3)/2*i ];
seededSecantFractal(f,rts,-2,2,0,50);
