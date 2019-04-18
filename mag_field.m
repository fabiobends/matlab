% M-file: mag_field.m
% M-file para calcular o campo magn�tico l�quido produzido
% por um estator trif�sico.
% Defini��o das condi��es b�sicas
bmax = 1; % Normalize bmax em 1
freq = 60; % 60 Hz
w = 2*pi*freq; % velocidade angular (rad/s)
% Inicialmente, determine os tr�s campos magn�ticos componentes
t = 0:1/6000:1/60;
Baa = sin(w*t).* (cos(0) + j*sin(0));
Bbb = sin(w*t-2*pi/3).* (cos(2*pi/3) + j*sin(2*pi/3));
Bcc = sin(w*t+2*pi/3).* (cos(-2*pi/3) + j*sin(-2*pi/3));
% C�lculo de B l�quida (Bnet)
Bnet = Baa + Bbb + Bcc;
% C�lculo de um c�rculo que representa o valor m�ximo esperado
% de B l�quida (Bnet)
circle = 1.5 * (cos(w*t) + j*sin(w*t));
% Plote o valor e o sentido dos campos magn�ticos
% resultantes. Observe que Baa � preta, Bbb � azul, Bcc �
% magenta e Bnet � vermelha.
for ii = 1:length(t)
% Plote o c�rculo de refer�ncia
plot(circle,'k');
hold on;
% Plote os quatro campos magn�ticos
plot([0 real(Baa(ii))],[0 imag(Baa(ii))],'k','LineWidth',2);
plot([0 real(Bbb(ii))],[0 imag(Bbb(ii))],'b','LineWidth',2);
plot([0 real(Bcc(ii))],[0 imag(Bcc(ii))],'m','LineWidth',2);
plot([0 real(Bnet(ii))],[0 imag(Bnet(ii))],'r','LineWidth',3);
axis square;
axis([-2 2 -2 2]);
drawnow;
hold off;
end