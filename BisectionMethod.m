clc
clear

syms x;  %Setting x as symbolic variable

y = input('Enter equations: ');
e = 0.0001;

% Intermediate value property
for i=0:1:10
   fa = subs(y,x,i);
   fb = subs(y,x,i+1);
   if(fa*fb<0)
       a = i;
       b = i+1;
       fprintf('\nAt least one root of the equation lies b/w %g & %g\n',a,b);
       break
   end
end

% Implementing Bisection Method
c = (a+b)/2;
fc = subs(y,x,c);
fprintf('\na\t\t\tb\t\t\tc\t\t\tf(c)\n');
i=0;
while abs(fc) > e
    fprintf('%f\t%f\t%f\t%f\n',a,b,c,fc);
    if fa*fc < 0
        b = c;
    else
        a = c;
    end
    c = (a+b)/2;
    fc = subs(y,x,c);
    i=i+1;
end
fprintf('\nRoot of given equation is: %f\n\n', c);
    