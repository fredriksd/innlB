%2a)

clear
format long

s = 0;
for n = 0:20
    a = ((-1)^n*pi^(2*n+1))/((2*n+1)*factorial(2*n+1));
    s = s+a; 
    if (abs(a)<1e-09)
        break
    end
end
fprintf('Integral av sin(x)/x fra 0 til pi gir %.3f\n', s)
fprintf('Dersom n = %d, faar man en noyaktighet paa 1e-09\n', n)

%2b)
clear 
format long
s = 0;

fprintf('Integral av 1/sqrt(2*pi)*e^(-x^2/2) fra 0 til 1\n')
for n = 0:100
   a = (-1/2)^n/((2*n+1)*factorial(n));
   s = s+a;
   if (abs(a)<1e-09)
       fprintf('Dersom n = %d, faar man en noyaktighet paa 1e-09\n', n)
       break;
   end
end
s = s*1/(sqrt(2*pi));
fprintf('Integralet blir tilnaerme s = %.11f\n', s)

