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

% Implementing Regular False Method
c = (a*fb - b*fa)/(fb - fa);
fc = subs(y,x,c);
fprintf('\na\t\t\tb\t\t\tfa\t\t\tfb\t\t\tc\t\t\tf(c)\n');

while abs(fc) > e
    fprintf('%f\t%f\t%f\t%f\t%f\t%f\n',a,b,fa,fb,c,fc);
    if fa*fc < 0
        b = c;
        fb = subs(y,x,b);
    else
        a = c;
        fa = subs(y,x,a);
    end
    c = (a*fb - b*fa)/(fb-fa);
    fc = subs(y,x,c);
end

if c > 0
    fprintf('\nRoot of the given equation is %g\n\n', c);
else
    fprintf('\nThere is no positive roots of the given equation\n');
end
