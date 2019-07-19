clear;
clc;

%define link lengths
r1 = 100;
r2 = 55;
r3 = 150;
r4 = 120;

global_const = 100;

%define theta2 range from 0 to 2 Pi, and theta3, theta4 as a vectors of
%same size
theta2 = linspace(0,2*pi,global_const);
theta3 = linspace(0,0,global_const);
theta4 = linspace(0,0,global_const);
theta3_dot = linspace(0,0,global_const);
theta4_dot = linspace(0,0,global_const);
theta3_dot_dot = linspace(0,0,global_const);
theta4_dot_dot = linspace(0,0,global_const);

%define angular velocity of theta2 as 40 rad/s
theta2_dot = 40;

theta2_dot_dot = 0;

%define constants h1,h2,h3,h4, and h5 used in a,b,c,d, and e calculations
h1 = r1/r2;
h2 = r1/r3;
h3 = r1/r4;
h4 = (-(r1^2)-(r2^2)-(r3^2)+(r4^2))/(2*r2*r3);
h5 = ((r1^2)+(r2^2)-(r3^2)+(r4^2))/(2*r2*r4);

%define constants a,b,c,d,e used in theta3 and theta4 calculations
for j = 1:global_const
    a(j) = -h1 + (1 + h2)*cos(theta2(j)) + h4;
    b(j) = -2*sin(theta2(j));
    c(j) = h1 - (1 - h2)*cos(theta2(j)) + h4;
    d(j) = -h1 + (1 - h3)*cos(theta2(j)) + h5;
    e(j) = h1 - (1 + h3)*cos(theta2(j)) + h5;
end

%Define equations for theta3 nd theta4
for i = 1:global_const
    theta3(i) = 2*atan((-b(i)-sqrt((b(i)^2)-4*a(i)*c(i)))/(2*a(i)));
    theta4(i) = 2*atan((-b(i)-sqrt(b(i)^2-4*d(i)*e(i)))/(2*d(i)));
    theta3_dot(i) = (r2*theta2_dot/r3)*((sin(theta2(i)-theta4(i)))/(sin(theta4(i)-theta3(i))));
    theta4_dot(i) = (r2*theta2_dot/r4)*((sin(theta2(i)-theta3(i)))/(sin(theta4(i)-theta3(i))));
    theta3_dot_dot(i) = (r4*(theta4_dot(i)^2) - r3*cos(theta3(i) - theta4(i))*(theta3_dot(i)^2) - r2*sin(theta2(i) - theta4(i))*(theta2_dot_dot) - r2*(theta2_dot^2)*cos(theta2(i) - theta4(i)))/(r3*sin(theta3(i) - theta4(i)));
    theta4_dot_dot(i) = (-r3*(theta3_dot(i)^2) + r4*cos(theta3(i) - theta4(i))*(theta4_dot(i)^2) - r2*sin(theta2(i) - theta3(i))*(theta2_dot_dot) - r2*(theta2_dot^2)*cos(theta2(i) - theta3(i)))/(r4*sin(theta3(i) - theta4(i)));
end

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
title('Angular Acceleration of Theta 3 and Theta 4 vs. Angular Displacement of Theta 2')
xlabel('Angular Displacement of Theta 2 [rad]')
ylabel('Angular Acceleration [rad/s^2]')
legend ('Theta 3', 'Theta 4')

