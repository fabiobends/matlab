function step_position_voltage()

% Modelo servo-motor
eta_m = 0.69;
eta_g = 0.9;
K_r = 14;
K_t = 7.68E-03;
K_m = K_t*eta_m;
K_g = K_r*eta_g; 
K_b = 7.68E-03;
R_m = 2.6;
J_m = 2.08E-3;
B_m = 0.015;

% Modelo planta ball and beam
m = 0.111;
R = 0.015;
g = 9.8;
L = 1.0;
d = 0.03;
J = 9.99e-6;

s = tf('s');
Transferfunction_teta_over_voltage = K_m*K_g/((R_m*J_m)*s^2+(R_m*B_m+K_b*K_m*K_g)*s);
Transferfunction_position_over_teta = (m*g*d)/(L*(J/R^2+m)*s^2);
Transferfunction_position_over_voltage = Transferfunction_teta_over_voltage*Transferfunction_position_over_teta;

step(Transferfunction_position_over_voltage,5); %o segundo pârametro em 'step' é o tempo (definido pelo usuário)

end
