%Oppgave 3
clear, close all
%Konstanter
g = 10;
k = 10;
m = 0.1;
c = 0.1;

%Analytisk løsning
syms y(t)
dy = diff(y,t,1);
d2y = diff(dy,t,1);
ode = d2y*m + c*dy + k*y == m*g;
cond = [y(0) == 0.2, dy(0) == 0];
ySol(t) = dsolve(ode,cond);

%Systemet av differensialligninger (nummerisk løsning)
F = @(t,Y) [0,1;-k/m,-c/m]*Y + [0;g]; 
y0 = [0.2;0];
[t,Y] = ode45(F,[0,5],y0); %Bruker ode45 (Runge-Kutta 4.5)

figure(1)
title('Dampened oscillation')
subplot(2,1,1)

plot(t,Y(:,1), '-or'), grid on, hold on %Plotter y-posisjonen
fplot(ySol,[0 5], '-xg'), hold off
xlabel('time (s)'), ylabel('Displacement (m)'), legend('Nummerisk','Analytisk')
subplot(2,1,2)
plot(t,Y(:,2)), grid on %Plotter v-verdiene
xlabel('time (s)'), ylabel('velocity (m/s)')
