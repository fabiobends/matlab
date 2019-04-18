function step_teta_voltage()
%   Esse programa foi desenvolvido por Fábio Mendes
%   Graduando em bacharelado em Engenharia Elétrica - UFPI

%   Essa função mostra a resposta ao degrau da função de tranferência
%   do angulo teta em relação á tensão aplicada
%   Essa função de tranferência está relacionada a modelo elétrico e
%   mecânico do motor de SRV02 da Quanser Inc.
%{

Constantes:

eta_m = constante de eficiência do torque
eta_g = constante de eficiência da engrenagem
K_r = constante de raio da engrenagem
K_t = constante do torque do motor
K_m = constante do torque do motor total
K_g = constante de raio de engrenagem total 
K_b = constante de força contra-eletromotriz
R_m = resistência da armadura
J_m = momento de inercia do motor (sem carga externa)
B_m = constante de fricção viscosa
%}

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

s = tf('s');
Transferfunction_teta_over_voltage = K_m*K_g/((R_m*J_m)*s^2+(R_m*B_m+K_b*K_m*K_g)*s) 
step(Transferfunction_teta_over_voltage,5); %o segundo pârametro em 'step' é o tempo (definido pelo usuário)
end

