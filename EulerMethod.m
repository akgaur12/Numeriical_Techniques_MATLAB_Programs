% Euler's method
clc
clear
f = input('Enter a function dy/dx = ');  %f = @(x,y) (x+y);
x = input('Enter the value of Xo: ');
y = input('Enter the value of Yo: ');
b = input('Enter the initial condition x: ');
n = input('Enter no. of subintervals n: '); 

a=x;
h = (b-a)/n;
fprintf('The value of h is: %g\n', h);

fprintf('\nitr\t\tx\t\t\ty\t\t\t\tdy/dx\t\t\tnew y\n');
for i=1:n
    Ydash(i) = f(x,y);
    newY = y + h*Ydash(i);
    fprintf('%d\t\t%.2f\t\t%0.5f\t\t\t%0.5f\t\t\t%0.5f\n',i,x, y, Ydash(i), newY);
    x=x+h;
    y=newY;
end

fprintf('\nThe approx value of y = %0.5f\n\n', y);


 