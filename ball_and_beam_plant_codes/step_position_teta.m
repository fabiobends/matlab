function step_position_teta()

%   Essa fun��o mostra a resposta ao degrau da fun��o de tranfer�ncia
%   do posi��o X em rela��o ao �ngulo teta
%   Essa fun��o de tranfer�ncia est� relacionada o modelo da equa��o
%   do movimento na planta 'Ball and Beam'.
%{

Contantes:

m = massa da bola (esfera)
R = raio da bola
g = constante de acelera��o da gravidade
L = comprimento da barra
d = raio da engrenagem (dist�ncia da extremidade ao centro)
J = momento de in�rcia da bola 
K_b = constante de for�a contra-eletromotriz
R_m = resist�ncia da armadura
%}

m = 0.111;
R = 0.015;
g = 9.8;
L = 1.0;
d = 0.03;
J = 9.99e-6;

s = tf('s');
Transferfunction_position_over_teta = (m*g*d)/(L*(J/R^2+m)*s^2);
step(Transferfunction_teta_over_voltage,5); %o segundo p�rametro em 'step' � o tempo (definido pelo usu�rio)

end