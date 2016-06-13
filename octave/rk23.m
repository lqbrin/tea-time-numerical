%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by Leon Brin                               31 May 2016 %
% Purpose: This function implements an adaptive rk2(3) method    %
%        where the step size is controlled by the routine.       %
%        Heun's third order method is combined with open-ode.    %
% INPUT: function f(x,y); interval [a,b]; y(a); initial step     %
%        size h; tolerance eps; maximum steps N;                 %
% OUTPUT: approximation (x(i),y(i)) of the solution of y'=f(x,y) %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [y,t,evals] = rk23(f,a,ya,b,h,eps,N)
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
    k2 = f(t(i)+h/3, y(i)+h/3*k1);
    k3 = f(t(i)+2*h/3, y(i)+2*h/3*k2);
    evals=evals+3;
    err = abs(h/4*(k1-2*k2+k3));
    if (done || err<=eps)
      y(i+1) = y(i) + h/4*(k1+3*k3);
      t(i+1) = t(i) + h;
      if (t(i+1) == t(i))
        disp("Procedure failed. Step size reached zero.")
        return
      endif
      i = i+1;
    endif
    q = 0.9*realpow(eps/err,1/3);
    q = max(q,0.1);
    q = min(5.0,q);
    h = q*h;
  end%while
  if (!done)
    disp("Procedure failed. Maximum number of iterations reached.")
  endif
end%function
