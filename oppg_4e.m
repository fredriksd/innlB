clear, close
v_0 = 20;
theta = 45;
ksi = 30;
phi = 20;
L = 70;
g = 9.81;
i = 1;
x(i) = 0;
y(i) = 0;
t(i) = 0;
%z(i) = 0;
dt = 0.01;
v_0x = v_0*cosd(theta)*sind(ksi);
v_0y = v_0*cosd(theta)*cosd(ksi);
v_0z = v_0*sind(theta);
v_0 = [v_0x;v_0y;v_0z];

%v_0 = [v_0*cosd(ksi);v_0*sind(ksi);(v_0(1).*v_0(2)).*sind(theta)];

z = @(t) v_0(3).*t - 1/2.*g.*t.^2;

while(z(t(i)) > -L*sin(phi))
    t(i+1) = t(i)+dt;
    x(i+1) = x(i) + v_0(1)*t(i);
    y(i+1) = y(i) + v_0(2)*t(i);
    i = i+1;
end

fimplicit3(@(x,y,z) sind(20)*x+cosd(20)*z,[0,70,-40,40,-20,20],'MeshDensity',4), hold on, axis equal
plot3(x,y,z(t)), hold off