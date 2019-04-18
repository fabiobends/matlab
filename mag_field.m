% M-file: mag_field.m
% M-file para calcular o campo magnético líquido produzido
% por um estator trifásico.
% Definição das condições básicas
bmax = 1; % Normalize bmax em 1
freq = 60; % 60 Hz
w = 2*pi*freq; % velocidade angular (rad/s)
% Inicialmente, determine os três campos magnéticos componentes
t = 0:1/6000:1/60;
Baa = sin(w*t).* (cos(0) + j*sin(0));
Bbb = sin(w*t-2*pi/3).* (cos(2*pi/3) + j*sin(2*pi/3));
Bcc = sin(w*t+2*pi/3).* (cos(-2*pi/3) + j*sin(-2*pi/3));
% Cálculo de B líquida (Bnet)
Bnet = Baa + Bbb + Bcc;
% Cálculo de um círculo que representa o valor máximo esperado
% de B líquida (Bnet)
circle = 1.5 * (cos(w*t) + j*sin(w*t));
% Plote o valor e o sentido dos campos magnéticos
% resultantes. Observe que Baa é preta, Bbb é azul, Bcc é
% magenta e Bnet é vermelha.
for ii = 1:length(t)
% Plote o círculo de referência
plot(circle,'k');
hold on;
% Plote os quatro campos magnéticos
plot([0 real(Baa(ii))],[0 imag(Baa(ii))],'k','LineWidth',2);
plot([0 real(Bbb(ii))],[0 imag(Bbb(ii))],'b','LineWidth',2);
plot([0 real(Bcc(ii))],[0 imag(Bcc(ii))],'m','LineWidth',2);
plot([0 real(Bnet(ii))],[0 imag(Bnet(ii))],'r','LineWidth',3);
axis square;
axis([-2 2 -2 2]);
drawnow;
hold off;
end