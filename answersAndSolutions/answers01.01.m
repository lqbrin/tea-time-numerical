% SECTION 1.1 Accuracy

format("long")
f=inline("x^4+7*x^3-63*x^2-295*x+350")
fp=inline("4*x^3+21*x^2-126*x-295")
ps=(f(-2+10^-7)-f(-2-10^-7))/(2*10^-7)
9-ps
(9-ps)/9
