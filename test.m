R_1 = 100;
R_2 = 55;
R_3 = 150;
R_4 = 120;
L_1 = R_1/R_3;
L_2 = R_1/R_2;
L_3 = ((R_1^2 + R_2^2 + R_3^2 - R_4^2)/(2*R_2*R_3));
L_4 = R_1/R_4;
L_5 = ((R_1^2 + R_2^2 - R_3^2 + R_4^2)/(2*R_2*R_3));

omega_2 = 40;

theta_2 = linspace(0, 2*pi, 100);

b = (-2.*sin(theta_2));
a = ((L_1 + 1).*(cos(theta_2)) - L_2 - L_3);
c = (-(1 - L_1).*(cos(theta_2)) + L_2 - L_3);
d = ((1 - L_4).*(cos(theta_2)) - L_2 + L_5); 
e = (-(L_4 - 1).*(cos(theta_2)) + L_2 + L_5);

X = (-b + sqrt((b.^2) - (4.*a.*c)))/(2.*a);
Y = (-b + sqrt((b.^2) - (4.*d.*e)))/(2.*d);

theta_3 = 2.*atan(X);
theta_4 = 2.*atan(Y);

omega_3 = ((omega_2*R_2)/R_3).*((sin(theta_2 - theta_4))/(sin(theta_4 - theta_3)));
omega_4 = ((omega_2*R_2)/R_4).*((sin(theta_2 - theta_3))/(sin(theta_4 - theta_3)));

%alpha_3 = (R_4.*(omega_4.^2) - R_3.*cos(theta_3 - theta_4).*(omega_3.^2) - R_2.*sin(theta_2 - theta_4).*(alpha_2) - R_2.*(omega_2.^2).*cos(theta_2 - theta_4))/(R_3.*sin(theta_3 - theta_4));
%alpha_4 = (-R_3.*(omega_3.^2) + R_4.*cos(theta_3 - theta_4).*(omega_4.^2) - R_2.*sin(theta_2 - theta_3).*(alpha_2) - R_2.*(omega_2.^2).*cos(theta_2 - theta_4))/(R_4.*sin(theta_3 - theta_4));

figure(1)
plot(theta_2, omega_3, 'r')
hold on;
plot(theta_2, omega_4, 'g')
hold on;
title('Angular Velocity of Theta 3 and Theta 4 vs. Angular Displacement of Theta 2')
xlabel('Angular Displacement of Theta 2 [rad]')
ylabel('Angular Velocity [rad/s]')
legend ('Theta 3', 'Theta 4')