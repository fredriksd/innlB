%Besvarelse av oppgave 3 med bruk av Euler's metode, numerisk l?sning
%Har ogs? et tilleggs-script med bruk av Runge-Kutta 4.5
%Se innl_b_oppg3_ode45.m 

clear 
%Konstanter
g = 10;
m = 0.1;
c = 0.1;
k = 10;

%Diff-ligninga v' = g-c/m*v - k/m * y
F = @(v,y) g - c/m * v - k/m * y;
%Initialbestemmelser
v(1) = 0;
y(1) = 0.2;
dt = 0.001;
t(1) = 0;
%Analytisk l?sning av diff-ligninga
syms Y(T)
dY = diff(Y,T,1);
d2Y = diff(dY,T,1);
ode = d2Y*m + c*dY + k*Y == m*g;
cond = [Y(0) == 0.2, dY(0) == 0];
ySol(T) = dsolve(ode,cond);

N = ceil(5/dt);
%Fj?rbevegelsen og loddets hastighet i 
%intervallet [0 5]
for n = 1:N
        y(n+1) = v(n)*dt + y(n);
        v(n+1) = F(v(n),y(n))*dt + v(n);
        t(n+1) = t(n)+dt;
end

figure(1)
subplot(2,1,1)
plot(t,v),grid on
xlabel('Time (s)'), ylabel('Velocity (m/s)')
legend('Velocity by time (numerical)')
subplot(2,1,2)
plot(t,y, 'r'), hold on
xlabel('Time (s)'), ylabel('Displacement (m)')
plot(t,ySol(t),'-g'), hold off
legend('Displacement by time (numerical)',...
    'Displacement by time (analytic)')
