function [xnew,diag] = sidiInitialize(x,k,f)
  l=length(x);
  for i=1:l
    P(i,1)=f(x(i));
  end%for
  for j=2:l
    for i=1:l+1-j
      P(i,j)=(P(i+1,j-1)-P(i,j-1))/(x(i+j-1)-x(i));
    end%for
  end%for
  for i=1:l
    diag(i)=P(i,l+1-i);
  end%for
  for i=1:l
    xnew(i)=x(i);
  end%for
  if (l==1)
    xnew(2)=x+f(xnew(1));
    diag(2)=f(xnew(2));
    diag(1)=(diag(2)-diag(1))/(xnew(2)-xnew(1));
    l=2;
  end%if
  for j=l+1:k
    temp=sidiMethod(xnew,diag,f);
    xnew(j)=temp;
    diag(j)=f(xnew(j));
    for i=j-1:-1:1
      diag(i)=(diag(i+1)-diag(i))/(xnew(j)-xnew(i));
    end%for
  end%for
end%function