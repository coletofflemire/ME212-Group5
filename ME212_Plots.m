%define link lengths
r1 = 0.1;
r2 = 0.055;
r3 = 0.15;
r4 = 0.11;

%define theta2 range from 0 to 2 Pi
theta2 = linspace(0,2*pi,100);
theta3 = linspace(0,0,100);
theta4 = linspace(0,0,100);

%define constants h1,h2,h3,h4, and h5 used in a,b,c,d, and e calculations
h1 = r1/r2;
h2 = r1/r3;
h3 = r1/r4;
h4 = (-(r1^2)-(r2^2)-(r3^2)+(r4^2))/(2*r2*r3);
h5 = ((r1^2)+(r2^2)-(r3^2)+(r4^2))/(2*r2*r4);

%define constants a,b,c,d,e used in theta3 and theta4 calculations
for j = 1:100
a(j) = -h1 + (1 + h2).*cos(theta2(j)) + h4;
b(j) = -2.*sin(theta2(j));
c(j) = h1 - (1 - h2).*cos(theta2(j)) + h4;
d(j) = -h1 + (1 - h3).*cos(theta2(j)) + h5;
e(j) = h1 - (1 + h3).*cos(theta2(j)) + h5;
end

%Define equations for theta3
for i = 1:100
    theta3(i) = 2.*atan((-b+sqrt((b.^2)-4.*a.*c))/(2.*a));
    theta3_dot = gradient(theta3);
    theta3_dot_dot = gradient(theta3_dot);
end

%Define equations for theta4
theta4 = 2.*atan((-b+sqrt(b.^2-4.*d.*e))/(2.*d));
theta4_dot = gradient(theta4);
theta4_dot_dot = gradient(theta4_dot);

%plot theta3 and theta4 together versus theta2
figure(1)
plot(theta2, theta3,'r')
hold on;
plot(theta2, theta4, 'g')
hold on;
title('Angular Displacement of Theta 3 and Theta 4 vs. Angular Displacement of Theta 2')
xlabel('Angular Displacement of Theta 2 [rad]')
ylabel('Angular Displacement [rad]')
legend ('Theta 3', 'Theta 4')

%plot theta3_dot and theta4_dot together versus theta2
figure(2)
plot(theta2, theta3_dot, 'r')
hold on;
plot(theta2, theta4_dot, 'g')
hold on;
title('Angular Velocity of Theta 3 and Theta 4 vs. Angular Displacement of Theta 2')
xlabel('Angular Displacement of Theta 2 [rad]')
ylabel('Angular Velocity [rad/s]')
legend ('Theta 3', 'Theta 4')

%plot theta3_dot_dot and theta4_dot_dot together versus theta2
figure(3)
plot(theta2, theta3_dot_dot, 'r')
hold on;
plot(theta2, theta4_dot_dot, 'g')
hold on;
title('Angular Accelleration of Theta 3 and Theta 4 vs. Angular Displacement of Theta 2')
xlabel('Angular Displacement of Theta 2 [rad]')
ylabel('Angular Acceleration [rad/s^2]')
legend ('Theta 3', 'Theta 4')

