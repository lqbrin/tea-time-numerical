T2 = inline('2+(x-exp(1)^2)/exp(1)^2-(x-exp(1)^2)^2/(2*exp(1)^4)');
bound = inline('(x-exp(1)^2)^3/(3*exp(1)^6)');

T2(12.33)
log(12.33)
bound(12.33)
abs(T2(12.33)-log(12.33))
abs(T2(3)-log(3))
