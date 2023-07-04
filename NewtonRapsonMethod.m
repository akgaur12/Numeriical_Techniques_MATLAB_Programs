
clear

syms x;  %Setting x as symbolic variable

y = input('Enter equations: ');
e = 0.0001;  % Tolerable error:

% Intermediate value property
for i=0:1:10
   fa = subs(y,x,i);
   fb = subs(y,x,i+1);
   if(fa*fb<0)
       a = i;
       b = i+1;
       fprintf('\nAt least one root lies b/w %g & %g ',a,b);
       fprintf('and value of function is %g & %g\n',fa,fb);
       
       if(abs(fa)<abs(fb))
           x0 = (a+b)/2-0.1;
       else
           x0 = (a+b)/2+0.1;
       end
       fprintf('initial value of x0 is %g\n\n', x0);
       break
   end
end

% Implementing Newton Raphson Method
k = diff(y,x);
i=1;
while abs(fa) > e
    fa = subs(y,x,x0);
    fd = subs(k,x,x0);
   
    if(fd==0)
        fprintf('Division by zero\n');
        break;
    end
    
    c = x0 - fa/fd;
    x0 = c;
    fprintf('%g iteration c = %g\n',i,c);
    i=i+1;
end;

if c > 0
    fprintf('\nRoot of the given equation is %g\n\n', c);
else
    fprintf('\nThere is no positive roots of the given equation\n');
end
