function step_position_teta()

%   Essa função mostra a resposta ao degrau da função de tranferência
%   do posição X em relação ao ãngulo teta
%   Essa função de tranferência está relacionada o modelo da equação
%   do movimento na planta 'Ball and Beam'.
%{

Contantes:

m = massa da bola (esfera)
R = raio da bola
g = constante de aceleração da gravidade
L = comprimento da barra
d = raio da engrenagem (distância da extremidade ao centro)
J = momento de inércia da bola 
K_b = constante de força contra-eletromotriz
R_m = resistência da armadura
%}

m = 0.111;
R = 0.015;
g = 9.8;
L = 1.0;
d = 0.03;
J = 9.99e-6;

s = tf('s');
Transferfunction_position_over_teta = (m*g*d)/(L*(J/R^2+m)*s^2);
step(Transferfunction_teta_over_voltage,5); %o segundo pârametro em 'step' é o tempo (definido pelo usuário)

end