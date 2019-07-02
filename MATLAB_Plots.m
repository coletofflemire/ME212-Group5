r1 = 0.1;
r2 = 0.055;
r3 = 0.1;
r4 = 0.055;

theta2 = 0:0.001:2*pi;

alpha = acos((r1^1 - r1*r2*cos(theta2)/(r1*sqrt(r1^2 + r2^2 - 2*r1*r2*cos(theta2)))));

beta = acos((r1^2 + r2^2 - 2*r1*r2*cos(theta2) + r4^2 - r3^2)/ (2 * r4 * sqrt(r1^2 + r2^2 - 2*r1*r2*cos(theta2))));

theta4 = pi - alpha - beta;
theta4_dot = diff(theta4);
theta4_dot_dot = diff(theta4_dot);

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
