clear;
clc;

%define link lengths
r1 = 0.1;
r2 = 0.055;
r3 = 0.15;
r4 = 0.11;

glob_const = 200;
%define theta 2 range from 0 to 2 Pi
theta2 = linspace(0,2*pi,glob_const);
alpha = linspace(0,0,glob_const);
beta = linspace(0,0,glob_const);

for i = 1:glob_const
    %use cosine law to find alpha
    alpha(i) = acos(((r1^2) - r1*r2*cos(theta2(i)))/(r1.*sqrt(r1^2 + r2^2 - 2*r1*r2*cos(theta2(i)))));

    %use cosine law to find beta
    beta(i) = acos((r1^2 + r2^2 - 2*r1*r2*cos(theta2(i)) + r4^2 - r3^2)/ (2*r4*sqrt(r1^2 + r2^2 - 2*r1*r2*cos(theta2(i)))));
end
alpha(1) = 0;
alpha(glob_const) = 0;

%use the angles obtained to find theta4, then find 1st and 2nd direvative
for i = 1:glob_const
    theta4(i) = pi - alpha(i) - beta(i);
end

theta4_dot = gradient(theta4);
theta4_dot_dot = gradient(theta4_dot);

%use geometry to find theta3, then differentiate for 1st and 2nd derivative
theta3 = asin((1/r3)*(r4*sin(theta4) - r2*sin(theta2)));
theta3 = abs(theta3);
theta3_dot = gradient(theta3);
theta3_dot_dot = gradient(theta3_dot);

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

