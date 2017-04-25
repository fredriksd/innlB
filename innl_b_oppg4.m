%Oppg 4a - d, DRONE
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

while(y(x(i)) >= -x(i)*tand(phi))
    x(i+1) = x(i) + (v_0*cosd(theta))*t(i);
    t(i+1) = t(i) + dt;
    i = i+1;
end

P = [x;y(x)];
M = [cosd(phi), -sind(phi);sind(phi), cosd(phi)];
Q = M*P;
x_rotated = Q(1,:);
y_rotated = Q(2,:);

plot(x,y(x)), hold on
plot([0, x_rotated],[0, y_rotated])
plot([0,L*cosd(phi)],[0,-L*sind(phi)])
plot([0 80],[0 0]), hold off 
xlabel('Lateral distance (m)'), ylabel('Vertical distance (m)')
legend('Kastebane, ikke-rotert','Kastebane,rotert','Skraaplan')

max = max_distance(y_rotated);
disp(max)

function max = max_distance(yval)
    max = 0;
    for i = 1:length(yval)
        temp = yval(i);
        if max < temp
           max = temp; 
        end
    end
end
