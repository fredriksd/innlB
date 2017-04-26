%oppg 4e - g, DRONE
clear, close

v_0 = 20;
theta = 45;
ksi = 20;
phi = 30;
L = 70;
g = 9.81;
i = 1;

x0 = 0;
x(i) = x0;
y0 = 0;
y(i) = y0;
t(i) = 0;
dt = 0.01;
z0 = 0;
z(i) = z0;

v_0x = v_0*cosd(theta)*cosd(phi);
v_0y = v_0*cosd(theta)*sind(phi);
v_0z = v_0*sind(theta);

while(z(i) >= -x(i)*tand(ksi)) 
   t(i+1) = t(i) + dt;
   x(i+1) = x0 + v_0x*t(i);
   y(i+1) = y0 + v_0y*t(i);
   z(i+1) = z0 + v_0z*t(i) - 1/2*g*t(i).^2;
   i = i+1;
end

M = [cosd(ksi), 0, -sind(ksi);
    0, 1, 0;
    sind(ksi),0, cosd(ksi)];

P = [x;y;z];
Q = M*P;
z_rotated = Q(3,:);
zMax = max(z_rotated);
fprintf('Maxmimal height (m): %.4f\n', zMax)

a = (z(end)-z(end-1))/(x(end)-x(end-1));
y_intp = (y(end) + y(end-1))/2;
x_intp = (x(end)+x(end-1))/2;
t_intp = (t(end)+t(end-1))/2;


%Bruker ikke de roterte z-koordinatene, da jeg 
%allerede har z-koordinaten for naar den treffer bakken
%fra while-loopen ovenfor.

%Interpolering av z
z_intp = a*(x_intp-x(end-1))+z(end-1);
fprintf('z(end) (m): %.4f\n', z(end))
fprintf('z(end-1) (m): %.4f\n', z(end-1))
fprintf('Interpolert z  (m): %.4f\n', z_intp)

fprintf('Tid fra oppskytning til landing: %.2fs\n',t_intp)
distance_to_home = sqrt(x_intp^2+z_intp^2);
fprintf('Distanse fra oppskytningspunkt til landingspunkt: %.2fm\n',...
    distance_to_home)

fimplicit3(@(x,y,z) sind(ksi)*x+cosd(ksi)*z,[0,70,-40,40,-20,20]...
    ,'MeshDensity',4), hold on, axis equal
plot3(x,y,z)
plot3(x_intp,y_intp,z_intp, 'x'), hold off
xlabel('Distance (m)'), zlabel('Height (m)')
legend('Rotated plane', 'Projectile projectory', 'Landing point')


