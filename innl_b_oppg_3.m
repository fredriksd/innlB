clear 

g = 10;
m = 0.1;
c = 0.1;
k = 10;

F = @(v,y) g - c/m * v - k/m * y;

v(1) = 0;
y(1) = 0.2;
dt = 0.0001;
t(1) = 0;
syms Y(T)
dY = diff(Y,T,1);
d2Y = diff(dY,T,1);
ode = d2Y*m + c*dY + k*Y == m*g;
cond = [Y(0) == 0.2, dY(0) == 0];
ySol(T) = dsolve(ode,cond);

N = ceil(5/dt);

for n = 1:N
        y(n+1) = v(n)*dt + y(n);
        v(n+1) = F(v(n),y(n))*dt + v(n);
        t(n+1) = t(n)+dt;
end

figure(1)
subplot(2,1,1)
plot(t,v),grid on
subplot(2,1,2)
plot(t,y), hold on
fplot(ySol,[0 5]), hold off

