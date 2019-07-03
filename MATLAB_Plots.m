%define link lengths
r1 = 0.1;
r2 = 0.055;
r3 = 0.1;
r4 = 0.055;

%define theta 2 range from 0 to 2 Pi
theta2 = 0:0.001:2*pi;

%use cosine law to find alpha
alpha = acos((r1^2 - r1*r2*cos(theta2))/(r1*sqrt(r1^2 + r2^2 - 2*r1*r2*cos(theta2))));

%use cosine law to find beta
beta = acos((r1^2 + r2^2 - 2*r1*r2*cos(theta2) + r4^2 - r3^2)/ (2 * r4 * sqrt(r1^2 + r2^2 - 2*r1*r2*cos(theta2))));

%use the angles obtained to find theta4, then find 1st and 2nd direvative
theta4 = pi - alpha - beta;
theta4_dot = diff(theta4);
theta4_dot_dot = diff(theta4_dot);

%use geometry to find theta3, then differentiate for 1st and 2nd derivative
theta3 = asin((1/r3)*(r4*sin(theta4) - r2*sin(theta2)));
theta3_dot = diff(theta3);
theta3_dot_dot = diff(theta3_dot);

plot(theta2, theta3)
hold on;
plot(theta2, theta3_dot)
hold on;
plot(theta2, theta3_dot_dot)
hold on;
plot(theta2, theta4)
hold on;
plot(theta2, theta4_dot)
hold on;
plot(theta2, theta4_dot_dot)
hold on;
