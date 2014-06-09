%f = inline('20*x^3-188*x^2-605*x+119');
f = inline('sin(x)');
h = 1;
i=0;
exact=cos(12);
while (12+h != 12)
  h = h/2;
  i=i+1;
  approx=(f(12+h)-f(12))/h;
  printf("%4d%22.14g%22.14g%22.14g\n", i , h , approx , abs(exact-approx));
end%while
