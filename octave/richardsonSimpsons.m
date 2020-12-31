function integral = richardsonSimpsons(f,a,b,n)
  int1 = compositeSimpsons(f,a,b,n);
  int2 = compositeSimpsons(f,a,b,2*n);
  integral = (16*int2-int1)/15;
end%function