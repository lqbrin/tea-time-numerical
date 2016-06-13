%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                                 9 June 2016 %
% Purpose: This function implements an adaptive rk3(4) method of   %
%        Butcher where the step size is controlled by the routine. %
% INPUT: function f(x,y); interval [a,b]; y(a); initial step       %
%        size h; tolerance eps; maximum steps N;                   %
% OUTPUT: approximation (x(i),y(i)) of the solution of y'=f(x,y)   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y,t,evals] = rk34butcher(f,a,ya,b,h,eps,N)
  i = 1;
  t(i) = a;
  y(i) = ya;
  done = 0;
  evals=0;
  while (!done && i<=N)
    if ((b-t(i)-h)*(b-a)<=0)
      h=b-t(i);
      done = 1;
    endif
    k1 = f(t(i), y(i));
    k2 = f(t(i)+h/4, y(i)+h/4*k1);
    k3 = f(t(i)+3*h/4, y(i)+h/4*(-9*k1+12*k2));
    k4 = f(t(i)+h/2, y(i)+h/36*(2*k1+15*k2+k3));
    k5 = f(t(i)+h, y(i)+h/9*(7*k1-15*k2-k3+18*k4));
    err = abs(h/18*(-11*k1+30*k2+2*k3-24*k4+3*k5));
    evals = evals+5;
    if (done || err<=eps)
      y(i+1) = y(i) + h/6*(k1+4*k4+k5);
      t(i+1) = t(i) + h;
      if (t(i+1) == t(i))
        disp("Procedure failed. Step size reached zero.")
        return
      endif
      i = i+1;
    endif
    q = 0.9*realpow(eps/err,1/4);
    q = max(q,0.1);
    q = min(5.0,q);
    h = q*h;
  end%while
  if (!done)
    disp("Procedure failed. Maximum number of iterations reached.")
  endif
end%function
