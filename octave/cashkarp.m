%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                               31 May 2016 %
% Purpose: This function implements the Cash-Karp RK4(5) method  %
%        where the step size is controlled by the routine.       %
%        Heun's third order method is combined with open-ode.    %
% INPUT: function f(x,y); interval [a,b]; y(a); initial step     %
%        size h; tolerance eps; maximum steps N;                 %
% OUTPUT: approximation (x(i),y(i)) of the solution of y'=f(x,y) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y,t,evals] = cashkarp(f,a,ya,b,h,eps,N)
  i = 1;
  y(i) = ya;
  t(i) = a;
  done = 0;
  evals=0;
  while (!done && i<=N)
    if ((b-t(i)-h)*(b-a)<=0)
      h=b-t(i);
      done = 1;
    endif
    k1 = f(t(i), y(i));
    k2 = f(t(i)+h/5, y(i)+h*k1/5);
    k3 = f(t(i)+3*h/10, y(i)+h*(3*k1+9*k2)/40);
    k4 = f(t(i)+3*h/5, y(i)+h*(3*k1-9*k2+12*k3)/10);
    k5 = f(t(i)+h, y(i)+h*(-11*k1+135*k2-140*k3+70*k4)/54);
    k6 = f(t(i)+7*h/8, y(i)+h*(3262*k1+37800*k2+4600*k3+44275*k4+6831*k5)/110592);
    evals=evals+6;
    err = abs(h*(-140162*k1+609400*k3-1114925*k4-630729*k5+1276416*k6)/32643072);
    if (done || err<=eps)
      y(i+1) = y(i) + h*(9361*k1+38500*k3+20125*k4+27648*k6)/95634;
      t(i+1) = t(i) + h;
      if (t(i+1) == t(i))
        disp("Procedure failed. Step size reached zero.")
        return
      endif
      i = i+1;
    endif
    q = 0.9*realpow(eps/err,1/5);
    q = max(q,0.1);
    q = min(5.0,q);
    h = q*h;
  end%while
  if (!done)
    disp("Procedure failed. Maximum number of iterations reached.")
  endif
end%function
