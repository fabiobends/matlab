% Exercicio computacional usando o banco de dados 
% das classes (virginica, setosa, versicolor) da flor Iris
% implementado pela Rede Neural KSOM
% Last modification: 25/03/2019 by F�bio Mendes

clear all;
clc, close all;

%---------------------------------------------
% Primeiro Passo: carregar os dados de entrada
%---------------------------------------------

load iris_setosa.dat
load iris_versicolor.dat
load iris_virginica.dat

% Amostras dos dados das flores

% XX_m=iris_setosa; 
% YY_m=iris_versicolor;
% ZZ_m=iris_virginica;

% 4-D : Dados referentes ao comprimento e largura da p�tala 

XX_set=[iris_setosa];             % entradas
YY_set=[iris_versicolor];
ZZ_set=[iris_virginica];         

[LIN,COL]=size(XX_set);

%---------------------------------------------------------
% Segundo Passo: Inicializa��o da Rede KSOM
%---------------------------------------------------------

n=0;                    % n�mero inicial de �pocas
n_max=100;              % n�mero de �pocas
g=5;                    % neur�nios em cada grupo
sigma_final=0.001;      % largura topol�gica final
sigma_initial=g/2;      % ------------------ inicial 
alpha_final=0.001;      % taxa de apredizagem final
alpha_initial=0.5;      % ------------------ inicial
sigma=[];               % largura topol�gica 
alpha=[];               % taxa de aprendizagem     
%---------------------------------------------------------
% Rede 1 - Treinamento Iris Setosa
%---------------------------------------------------------

w_in_1=[];
x_in_1=[];

for i=1:g

  w_in_1(i,:)=rand(1,COL);  % vetor prot�tipo de 'entrada' do grupo 'i' valores em dist. uniforme [0,1]

end

%---------------------------------------------------------
% Rede 2 - Treinamento Iris Versicolor
%---------------------------------------------------------

w_in_2=[];
x_in_2=[];

for i=1:g
  
  w_in_2(i,:)=rand(1,COL);  % vetor prot�tipo de 'entrada' do grupo 'i' valores em dist. uniforme [0,1]


end

%---------------------------------------------------------
% Rede 3 - Treinamento Iris Virg�nica
%---------------------------------------------------------

w_in_3=[];
x_in_3=[];

for i=1:g
  
  w_in_3(i,:)=rand(1,COL);  % vetor prot�tipo de 'entrada' do grupo 'i' valores em dist. uniforme [0,1]


end

%---------------------------------------------------------

while n<n_max

n=n+1;

h=size(XX_set);         % dimensao do vetor de entrada

ind=randperm(h(:,1));
  
XX=[];YY=[];ZZ=[];
XX_train=[];YY_train=[];ZZ_train=[];
XX_test=[];YY_test=[];ZZ_test=[];


for i=1:LIN

    XX=[XX; XX_set(ind(i),:)];
    YY=[YY; YY_set(ind(i),:)];
    ZZ=[ZZ; ZZ_set(ind(i),:)];

end

XX_train=[XX_train; XX(1:40,:)];        %--------------------------------------%
XX_test=[XX_test; XX(41:50,:)];         %                                      %
                                        %                                      %
YY_train=[YY_train; YY(1:40,:)];        %    Amostras para treino (entradas)   % 
YY_test=[YY_test; YY(41:50,:)];         %        e teste das classes           %
                                        %            de floress                %
ZZ_train=[ZZ_train; ZZ(1:40,:)];        %                                      %
ZZ_test=[ZZ_test; ZZ(41:50,:)];         %                                      %
                                        %--------------------------------------%

alpha(n)=alpha_initial*(alpha_final/alpha_initial)^((n)/n_max); % valor calculado de alpha
sigma(n)=sigma_initial*(sigma_final/sigma_initial)^((n)/n_max); % ------------------ sigma

%---------------------------------------------------------
% Rede 1 - Treinamento Iris Setosa
%---------------------------------------------------------

t=0;
x_in_1=XX_train;                    % x_in � igual aos valores de treinamento menos os valores

ind_neuron=[];                      % valores de dist�ncia euclidiana para determinado vetor prot�tipo 'i'
winner_neuron=[];                   % �ndice do neur�nio vencedor no treinamento no tempo 't'
h_vero=[];                          % fun��o de vizinhan�a do neuron 'i' em rela��o ao neuron vencedor no tempo 't'

for t=1:(0.8*LIN)
  
  for i=1:g
    
    ind_neuron(i)=norm(x_in_1(t,:)-w_in_1(i,:));  % teste do vencedor
  
  end 
    
  [~, winner_neuron(t)]=min(ind_neuron); % quais neur�nios venceram para as todas as entradas

end  

for t=1:(0.8*LIN)
    
  for i=1:g
    
    h_vero(t,i)=exp(-(1/(2*sigma(n)^2))*(norm(w_in_1(winner_neuron(t),:)-w_in_1(i,:)))^2);
    w_in_1(i,:)=w_in_1(i,:)+alpha(n)*h_vero(t,i)*(x_in_1(t,:)-w_in_1(i,:));
    % c�lculo da fun��o de vizinhan�a e atualiza��o dos pesos  
  end

end
 
for i=1:g
  
  class_1_label(i,:)=[1 0 0];   % r�tulo da classe 1 para todos os neur�nios da classe
  
end  

w_in_1=[w_in_1 class_1_label];  % r�tulo adicionado, caracterizando a classe
  
clear i ind_neuron winner_neuron h_vero; % limpeza dos vari�veis

%---------------------------------------------------------
% Rede 2 - Treinamento Iris Versicolor
%---------------------------------------------------------

t=0;
x_in_2=YY_train;                    % x_in � igual aos valores de treinamento menos os valores

ind_neuron=[];                      % valores de dist�ncia euclidiana para determinado vetor prot�tipo 'i'
winner_neuron=[];                   % �ndice do neur�nio vencedor no treinamento no tempo 't'
h_vero=[];                          % fun��o de vizinhan�a do neuron 'i' em rela��o ao neuron vencedor no tempo 't'

for t=1:(0.8*LIN)
  
  for i=1:g
    
    ind_neuron(i)=norm(x_in_1(t,:)-w_in_2(i,:));
  
  end 
    
  [~, winner_neuron(t)]=min(ind_neuron); 

end  

for t=1:(0.8*LIN)
    
  for i=1:g
    
    h_vero(t,i)=exp(-(1/(2*sigma(n)^2))*(norm(w_in_2(winner_neuron(t),:)-w_in_2(i,:)))^2);
    w_in_2(i,:)=w_in_2(i,:)+alpha(n)*h_vero(t,i)*(x_in_2(t,:)-w_in_2(i,:));
      
  end

end

for i=1:g
  
  class_2_label(i,:)=[0 1 0];
  
end  

w_in_2=[w_in_2 class_2_label];

clear i ind_neuron winner_neuron h_vero;

% coment�rios s�o semelhantes para a classe 2

%---------------------------------------------------------
% Rede 3 - Treinamento Iris Virg�nica
%---------------------------------------------------------

t=0;
x_in_3=ZZ_train;                    % x_in � igual aos valores de treinamento menos os valores

ind_neuron=[];                      % valores de dist�ncia euclidiana para determinado vetor prot�tipo 'i'
winner_neuron=[];                   % �ndice do neur�nio vencedor no treinamento no tempo 't'
h_vero=[];                          % fun��o de vizinhan�a do neuron 'i' em rela��o ao neuron vencedor no tempo 't'

for t=1:(0.8*LIN)
  
  for i=1:g
    
    ind_neuron(i)=norm(x_in_1(t,:)-w_in_3(i,:));
  
  end 
    
  [~, winner_neuron(t)]=min(ind_neuron); % qual neur�nio venceu

end  

for t=1:(0.8*LIN)
    
  for i=1:g
    
    h_vero(t,i)=exp(-(1/(2*sigma(n)^2))*(norm(w_in_3(winner_neuron(t),:)-w_in_3(i,:)))^2);
    w_in_3(i,:)=w_in_3(i,:)+alpha(n)*h_vero(t,i)*(x_in_3(t,:)-w_in_3(i,:));
      
  end

end

for i=1:g
  
  class_3_label(i,:)=[0 0 1];
  
end  

w_in_3=[w_in_3 class_3_label];

clear i ind_neuron winner_neuron h_vero x_in_1 x_in_2 x_in_3;

% coment�rios s�o semelhantes para a classe 3

%---------------------------------------------------------
% Prepara��o dos dados e Teste da rede
%---------------------------------------------------------

% Populacao total das flores

TT=[];                                  %------------------------------------%
TT = [TT; XX_test];                     %                                    %
TT = [TT; YY_test];                     %  Aqui todas as amostras de teste   %
TT = [TT; ZZ_test];                     %       s�o 'embaralhadas'           % 
                                        %                                    %
h=size(TT);                             %------------------------------------%
                             
ind=randperm(h(:,1));

dados=[];

for i=1:30

  dados=[dados; TT(ind(i),:)];

end

clear ind;

% Agrupamentos de todos os vetores prot�tipos

w_in=[w_in_1; w_in_2; w_in_3];    

% Entrada para teste

x_in=dados;

% Teste das amostras e dos agrupamentos

t=0;
ind_neuron=[];
winner=[];

% vetores da classes reconhecidas

class_1=[];
class_2=[];
class_3=[];

% posi��o dos vetores prot�tipos (pontos de atra��o)

pos_winner_1=[];
pos_winner_2=[];
pos_winner_3=[];

while t<(30)
  
  t=t+1;
  
  for i=1:size(w_in,1)                            % n�mero total de neur�nios 
                                                      
    ind_neuron(i)=norm(x_in(t,:)-w_in(i,1:COL));  % s� as informa��es sem o r�tulo para a compara��o
    
  end
    
  [~, winner(t)]=min(ind_neuron);               % verifica��o do neur�nio vencedor para a entrada 't'
                                                    
  
  if w_in(winner(t),(COL+1):end)==class_1_label(1,:) % compara��o do r�tulo do vencedor com a classe
  
  class_1=[class_1; x_in(t,:)];                       % amostra classificada C1         
  pos_winner_1=[pos_winner_1; w_in(winner(t),1:COL)]; % posi��o onde o neur�nio vencedor se localiza
  
  elseif w_in(winner(t),(COL+1):end)==class_2_label(1,:) % compara��o do r�tulo do vencedor com a classe
  
  class_2=[class_2; x_in(t,:)];                       % amostra classificada C2  
  pos_winner_2=[pos_winner_2; w_in(winner(t),1:COL)]; % posi��o onde o neur�nio vencedor se localiza
  
  elseif w_in(winner(t),(COL+1):end)==class_3_label(1,:)% compara��o do r�tulo do vencedor com a classe

  class_3=[class_3; x_in(t,:)];                       % amostra classificada C3  
  pos_winner_3=[pos_winner_3; w_in(winner(t),1:COL)]; % posi��o onde o neur�nio vencedor se localiza
  
  else
  
  fprintf('Erro!\n');                     % no caso de comportamento desconhecido
  
  end

end

%---------------------------------------------------------
% Representa��o gr�fica das classes (2-D)
%---------------------------------------------------------

fprintf('Foram selecionadas %d amostras para a classe 1!\n\n',size(class_1,1))
fprintf('Foram selecionadas %d amostras para a classe 2!\n\n',size(class_2,1))
fprintf('Foram selecionadas %d amostras para a classe 3!\n\n',size(class_3,1))
fprintf('Valor de alfa: %.4f\n\n',alpha(n)); % valor de alfa calculado at� o momento
fprintf('Porcentagem do treinamento: %.1f%% \n\n',(n/n_max)*100); %porcentagem do treinamento

%quantidade de acertos para as tr�s classes

item1(n)=size(class_1,1);       
item2(n)=size(class_2,1);
item3(n)=size(class_3,1);

% mudan�a de vari�vel para o treinamento da pr�xima �poca
% vetor que era 1x7 volta a ser 1x4

temp1=w_in_1(:,1:COL);
temp2=w_in_2(:,1:COL);
temp3=w_in_3(:,1:COL);

clear w_in_1 w_in_2 w_in_3

w_in_1=temp1;
w_in_2=temp2;
w_in_3=temp3; 

% fim do treinamento da �poca e retreinamento prossegue

end

figure(1)

hold on

title('Posicao dos pesos w_{in}');

plot(pos_winner_1(:,1),pos_winner_1(:,2),'r*');
plot(pos_winner_2(:,1),pos_winner_2(:,2),'b+');        
plot(pos_winner_3(:,1),pos_winner_3(:,2),'kx');
xlabel('Comprimento da petala')
ylabel('Largura da petala')
legend('Classe 1', 'Classe 2', 'Classe 3', 'Location', 'northwest')       

hold off

t=1:n_max;

figure(2)

hold on

title('Comportamento do treinamento');

plot(t,item1,'r');
plot(t,item2,'b');
plot(t,item3,'k');
xlabel('�pocas de treinamento')
ylabel('N�mero de acertos')
legend('Classe 1', 'Classe 2', 'Classe 3', 'Location', 'southeast')       

hold off

