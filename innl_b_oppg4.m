clear, close
v_0 = 20;
theta = 45;
g = 9.81;

L = 70;
phi = 20;

y = @(x) x.*(tand(theta)-g.*x/(2.*v_0.^2.*(cosd(theta)).^2));
i = 1;
x(i) = 0;
t(i) = 0;
dt = 0.0001;

while(y(x(i)) > -L*sind(phi))
    x(i+1) = x(i) + (v_0*cosd(theta))*t(i);
    t(i+1) = t(i) + dt;
    i = i+1;
    %plot(x,y(x),[0,L*cosd(phi)],[0,-L*sind(phi)]),axis equal, grid on
    %drawnow
end

P = [x;y(x)];
M = [cosd(phi), -sind(phi);sind(phi), cosd(phi)];
Q = M*P;
x_rotated = Q(1,:);
y_rotated = Q(2,:);
plot(x,y(x)), hold on
plot(x_rotated,y_rotated)
plot([0,L*cosd(phi)],[0,-L*sind(phi)]), hold off
legend('Ikke-rotert system', 'Rotert system')