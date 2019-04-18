% Exercicio computacional usando o banco de dados 
% das classes (virginica, setosa, versicolor) da flor Iris
% implementado pela Rede Neural KSOM
% Last modification: 06/03/2019 by Fábio Mendes

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

% 3-D : Dados referentes ao comprimento e largura da pétala 

XX_set=[iris_setosa(:,1) iris_setosa(:,2) iris_setosa(:,3)];             % entradas
YY_set=[iris_versicolor(:,1) iris_versicolor(:,2) iris_versicolor(:,3)];
ZZ_set=[iris_virginica(:,1) iris_virginica(:,2) iris_virginica(:,3)];         

% 1-D : Dados referentes à largura da sépala 

X_set=[iris_setosa(:,4)];              % saídas
Y_set=[iris_versicolor(:,4)];
Z_set=[iris_virginica(:,4)];         

[LIN,COL]=size(XX_set);
[~,COL_]=size(X_set);


%---------------------------------------------------------
% Segundo Passo: Inicialização da Rede KSOM
%---------------------------------------------------------

n=0;                    % número inicial de épocas
n_max=100;              % número de épocas
g=5;                    % neurônios em cada grupo
sigma=g/2;              % largura topológica
alpha=[];
alpha_final=0.01;         % taxa de apredizagem da rede
alpha_initial=0.4;

%---------------------------------------------------------
% Rede 1 - Treinamento Iris Setosa
%---------------------------------------------------------

w_in_1=[];
x_in_1=[];

for i=1:g
  w_in_1(:,:,i)=rand((0.8*LIN),COL);  % vetor protótipo de 'entrada' do grupo 'i' valores em dist. uniforme [0,1]
  w_out_1(:,:,i)=rand(0.8*LIN,COL_);           % vetor protótipo de 'saída' do grupo 'i' valores em dist. uniforme [0,1]
end

%---------------------------------------------------------
% Rede 2 - Treinamento Iris Versicolor
%---------------------------------------------------------

w_in_2=[];
x_in_2=[];

for i=1:g
  w_in_2(:,:,i)=rand((0.8*LIN),COL); 
  w_out_2(:,:,i)=rand(0.8*LIN,COL_);           % vetor protótipo de 'saída' do grupo 'i' valores em dist. uniforme [0,1]
end

%---------------------------------------------------------
% Rede 3 - Treinamento Iris Virgínica
%---------------------------------------------------------

w_in_3=[];
x_in_3=[];

for i=1:g
  w_in_3(:,:,i)=rand((0.8*LIN),COL); 
  w_out_3(:,:,i)=rand(0.8*LIN,COL_);           % vetor protótipo de 'saída' do grupo 'i' valores em dist. uniforme [0,1]
end


%---------------------------------------------------------

while n<n_max

h=size(XX_set);         % dimensao do vetor de entrada

%lamda=0.001;            % taxa de apredizagem do LMS                

n=n+1;
alpha(n)=alpha_initial*(alpha_final/alpha_initial)^((n-1)/n_max);
ind=randperm(h(:,1));
  
XX=[];YY=[];ZZ=[];
XX_train=[];YY_train=[];ZZ_train=[];
XX_test=[];YY_test=[];ZZ_test=[];

X=[];Y=[];Z=[];
X_train=[];Y_train=[];Z_train=[];

for i=1:LIN

    XX=[XX; XX_set(ind(i),:)];
    YY=[YY; YY_set(ind(i),:)];
    ZZ=[ZZ; ZZ_set(ind(i),:)];
    
    X=[X; X_set(ind(i),:)];
    Y=[Y; Y_set(ind(i),:)];
    Z=[Z; Z_set(ind(i),:)];

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

X_train=[X_train; X(1:40,:)];           %--------------------------------------%
Y_train=[Y_train; Y(1:40,:)];           %       Amostras para a saída          %
Z_train=[Z_train; Z(1:40,:)];           %--------------------------------------%


%---------------------------------------------------------
% Rede 1 - Treinamento Iris Setosa
%---------------------------------------------------------

t=0;
x_in_1=XX_train;                    % x_in é igual aos valores de treinamento menos os valores
x_out_1=X_train;                    % retirados para a estimação 

ind_neuron=[];                      % valores de distância euclidiana para determinado vetor protótipo 'i'
winner_neuron=[];                   % índice do neurônio vencedor no treinamento no tempo 't'
h_vero=[];                          % função de vizinhança do neuron 'i' em relação ao neuron vencedor no tempo 't'

while t<(0.8*LIN)
  
  t=t+1;
  
  for i=1:g
    ind_neuron(i)=norm(x_in_1(t,:)-w_in_1(t,:,i));
  end 
    [~, winner_neuron(t)]=min(ind_neuron);
  
  for i=1:g
    
    h_vero(t,i)=exp(-(1/(2*sigma^2))*(norm(w_in_1(t,:,winner_neuron(t))-w_in_1(t,:,i)))^2);
    w_in_1(t,:,i)=w_in_1(t,:,i)+alpha(n)*h_vero(t,i)*(x_in_1(t,:)-w_in_1(t,:,i));
    w_out_1(t,:,i)=w_out_1(t,:,i)+alpha(n)*h_vero(t,i)*(x_out_1(t)-w_out_1(t,:,i));

  end

end  

clear i ind_neuron winner_neuron h_vero;

%---------------------------------------------------------
% Rede 2 - Treinamento Iris Versicolor
%---------------------------------------------------------

t=0;
x_in_2=YY_train;                    % x_in é igual aos valores de treinamento menos os valores
x_out_2=Y_train;                    % retirados para a estimação 

ind_neuron=[];                      % valores de distância euclidiana para determinado vetor protótipo 'i'
winner_neuron=[];                   % índice do neurônio vencedor no treinamento no tempo 't'
h_vero=[];                          % função de vizinhança do neuron 'i' em relação ao neuron vencedor no tempo 't'

while t<(0.8*LIN)
  
  t=t+1;
  
  for i=1:g
    ind_neuron(i)=norm(x_in_2(t,:)-w_in_2(t,:,i));
  end 
    [~, winner_neuron(t)]=min(ind_neuron);
  
  for i=1:g
    
    h_vero(t,i)=exp(-(1/(2*sigma^2))*(norm(w_in_2(t,:,winner_neuron(t))-w_in_2(t,:,i)))^2);
    w_in_2(t,:,i)=w_in_2(t,:,i)+alpha(n)*h_vero(t,i)*(x_in_2(t,:)-w_in_2(t,:,i));
    w_out_2(t,:,i)=w_out_2(t,:,i)+alpha(n)*h_vero(t,i)*(x_out_2(t)-w_out_2(t,:,i));

  end

end  

clear i ind_neuron winner_neuron h_vero;

%---------------------------------------------------------
% Rede 3 - Treinamento Iris Virgínica
%---------------------------------------------------------

t=0;
x_in_3=ZZ_train;                    % x_in é igual aos valores de treinamento menos os valores
x_out_3=Z_train;                    % retirados para a estimação 

ind_neuron=[];                      % valores de distância euclidiana para determinado vetor protótipo 'i'
winner_neuron=[];                   % índice do neurônio vencedor no treinamento no tempo 't'
h_vero=[];                          % função de vizinhança do neuron 'i' em relação ao neuron vencedor no tempo 't'

while t<(0.8*LIN)
  
  t=t+1;
  
  for i=1:g
    ind_neuron(i)=norm(x_in_3(t,:)-w_in_3(t,:,i));
  end 
    [~, winner_neuron(t)]=min(ind_neuron);
  
  for i=1:g
    
    h_vero(t,i)=exp(-(1/(2*sigma^2))*(norm(w_in_3(t,:,winner_neuron(t))-w_in_3(t,:,i)))^2);
    w_in_3(t,:,i)=w_in_3(t,:,i)+alpha(n)*h_vero(t,i)*(x_in_3(t,:)-w_in_3(t,:,i));
    w_out_3(t,:,i)=w_out_3(t,:,i)+alpha(n)*h_vero(t,i)*(x_out_3(t)-w_out_3(t,:,i));

  end

end  

clear i ind_neuron winner_neuron h_vero x_in_1 x_in_2 x_in_3;

%---------------------------------------------------------
% Preparação dos dados e Teste da rede
%---------------------------------------------------------

% Populacao total das flores

TT=[];                                  %------------------------------------%
TT = [TT; XX_test];                     %                                    %
TT = [TT; YY_test];                     %  Aqui todas as amostras de teste   %
TT = [TT; ZZ_test];                     %       são 'embaralhadas'           % 
                                        %                                    %
h=size(TT);                             %------------------------------------%
ind=randperm(h(:,1));
dados=[];
for i=1:30
    dados=[dados; TT(ind(i),:)];
end
clear ind;

% Agrupamentos de todos os vetores protótipos

w_in=[];
w_out=[];

for i=1:g
  w_in(:,:,i)=w_in_1(:,:,i); 
  w_out(:,:,i)=w_out_1(:,:,i);                %--------------------------------%       
end                                           %  Já aqui todos dos grupos de   %
                                              %   vetores protótipos são       %
for i=1:g                                     % "embaralhados", tendo no total %
  w_in(:,:,i+g)=w_in_2(:,:,i);                %   '3*g' grupos, 3 classes com  %
  w_out(:,:,i+g)=w_out_2(:,:,i);              %         'g' grupos cada        %                     
end                                           %                                %
                                              %--------------------------------% 
for i=1:g
  w_in(:,:,i+2*g)=w_in_3(:,:,i);  
  w_out(:,:,i+2*g)=w_out_3(:,:,i); 
end

x_in=dados;

% Teste das amostras e dos agrupamentos

t=0;
ind_neuron=[];
winner_neuron=[];
winner_vector=[];
winner=[];

x_in_1=[];
x_in_2=[];
x_in_3=[];

%p_1=[];
%p_2=[];
%p_3=[];

R_1=[];
R_2=[];
R_3=[];

n_1=0;n_2=0;n_3=0;

% vetores da classes reconhecidas

class_1=[];
class_2=[];
class_3=[];

% vetores da classes estimadas

class_1_est=[];
class_2_est=[];
class_3_est=[];

% posição dos vetores protótipos (pontos de atração)

pos_winner_1=[];
pos_winner_2=[];
pos_winner_3=[];

while t<(30)
  
  t=t+1;
  
  for i=1:3*g
    
    for vector=1:40
 
      ind_neuron(i)=norm(x_in(t,:)-w_in(vector,:,i));
    
    end
    
    [~, winner_vector(i)]=min(ind_neuron);       % verificação do neurônio vencedor do peso para os 40 vetores
                                                 % protótipos do '3*g' grupos diferentes
  end                                                   
  
  for vector=1:40
    
    for i=1:3*g
 
      ind_neuron(i)=norm(x_in(t,:)-w_in(vector,:,i));
    
    end
    
    [~, winner_neuron(vector)]=min(ind_neuron);       % verificação do vetor vencedor para os '3*g' grupos
                                                      
  end                                                   
    
  %winner(t)=mode(winner_neuron);                            % aquele que mais se repete, é o vencedor
  winner(t)=round(median(winner_neuron));                  % foi tentado a média da classe de grupos, porém tem resultado semelhante
    
    if winner(t)<(g+1)                                % caso um dos 'g' primeiros grupos é selecionado  
      n_1=n_1+1;
      x_in_1=[x_in_1; x_in(t,:)];
      %p_1=[p_1; w_out(winner(t),:,winner(t))];
        if mod(winner_vector(winner(t)),40) == 0
          R_1=[R_1; w_in(40,:,winner(t))];
        else  
          R_1=[R_1; w_in(mod(winner_vector(winner(t)),40),:,winner(t))];
        end
      class_1=[class_1; x_in(t,:)];                    % foi classificado como classe 1
      
    elseif g<winner(t) & winner(t)<(2*g+1)            % caso um dos 'g' primeiros grupos do meio é selecionado
      n_2=n_2+1;
      x_in_2=[x_in_2; x_in(t,:)];
      %p_2=[p_2; w_out(winner(t),:,winner(t))];
         if mod(winner_vector(winner(t)),40) == 0
           R_2=[R_2; w_in(40,:,winner(t))];
         else   
           R_2=[R_2; w_in(mod(winner_vector(winner(t)),40),:,winner(t))];
         end
      class_2=[class_2; x_in(t,:)];                    % foi classificado como classe 2 
      
    else                                              % caso um dos 'g' últimos grupos é selecionado
      n_3=n_3+1;
      x_in_3=[x_in_3; x_in(t,:)];
      %p_3=[p_3; w_out(winner(t),:,winner(t))];
         if mod(winner_vector(winner(t)),40) == 0
           R_3=[R_3; w_in(40,:,winner(t))];
         else   
           R_3=[R_3; w_in(mod(winner_vector(winner(t)),40),:,winner(t))];
         end
      class_3=[class_3; x_in(t,:)];                    % foi classificado como classe 3
      
    end
end  

%{
 a_1=inv((R_1'*R_1+lamda*eye(size(R_1'*R_1,1))))*(R_1'*p_1); 
%[~, R_cond_1]=inv(a_1);
a_2=inv((R_2'*R_2+lamda*eye(size(R_2'*R_2,1))))*R_2'*p_2; 
%[~, R_cond_2]=inv(a_2);
a_3=inv((R_3'*R_3+lamda*eye(size(R_3'*R_3,1))))*R_3'*p_3; 
%[~, R_cond_3]=inv(a_3);

pos_winner_1=R_1;
pos_winner_2=R_2;
pos_winner_3=R_3;
                 
class_1_est=a_1.*x_in_1';
class_2_est=a_2.*x_in_2';
class_3_est=a_3.*x_in_3';


%}

pos_winner_1=R_1;
pos_winner_2=R_2;
pos_winner_3=R_3;



%---------------------------------------------------------
% Representação gráfica das classes (2-D)
%---------------------------------------------------------


fprintf('Foram selecionadas %d amostras para a classe 1!\n\n',size(class_1,1))
fprintf('Foram selecionadas %d amostras para a classe 2!\n\n',size(class_2,1))
fprintf('Foram selecionadas %d amostras para a classe 3!\n\n',size(class_3,1))
fprintf('Valor de alfa: %.4f\n\n',alpha(n));
fprintf('Porcentagem do treinamento: %.1f%% \n\n',(n/n_max)*100);

%fprintf('Grau de oondicionamento: %.2f %.2f %.2f.\n\n',R_cond_1, R_cond_2, R_cond_3);

item1(n)=size(class_1,1);
item2(n)=size(class_2,1);
item3(n)=size(class_3,1);

%{
figure(1);

hold on

title('Classificacao da flor Iris - KSOM');


plot(class_1(:,1),class_1(:,2),'r*');
plot(class_2(:,1),class_2(:,2),'b+');        
plot(class_3(:,1),class_3(:,2),'kx');
xlabel('Comprimento da petala')
ylabel('Largura da petala')
legend('Classe 1','Classe 2','Classe 3','Location', 'northwest')

hold off

%{

figure(2);

hold on

title('Classificacao da flor Iris - KSOM (com estimação da entrada)');

plot(class_1(:,1),class_1(:,2),'r*');
plot(class_1_est(:,1),class_1_est(:,2),'ro');
plot(class_2(:,1),class_2(:,2),'b+');        
plot(class_2_est(:,1),class_2_est(:,2),'bs');        
plot(class_3(:,1),class_3(:,2),'kx');
plot(class_3_est(:,1),class_3_est(:,2),'k^');
xlabel('Comprimento da pétala')
ylabel('Largura da pétala')
legend('Classe 1', 'Classe 1*', 'Classe 2', 'Classe 2*', ...
       'Classe 3', 'Classe 3*', 'Location', 'northwest')       

hold off

%}

figure(3);

hold on

title('Classificacao da flor Iris - KSOM');

plot(class_1(:,1),class_1(:,3),'r*');
plot(class_2(:,1),class_2(:,3),'b+');        
plot(class_3(:,1),class_3(:,3),'kx');
xlabel('Comprimento da petala')
ylabel('Comprimento da sepala')
legend('Classe 1','Classe 2','Classe 3','Location', 'northwest')

hold off

%{

figure(4);

hold on

title('Classificacao da flor Iris - KSOM (com estimação da entrada)');

plot(class_1(:,1),class_1(:,3),'r*');
plot(class_1_est(:,1),class_1_est(:,3),'ro');
plot(class_2(:,1),class_2(:,3),'b+');        
plot(class_2_est(:,1),class_2_est(:,3),'bs');        
plot(class_3(:,1),class_3(:,3),'kx');
plot(class_3_est(:,1),class_3_est(:,3),'k^');
xlabel('Comprimento da pétala')
ylabel('Comprimento da sépala')
legend('Classe 1', 'Classe 1*', 'Classe 2', 'Classe 2*', ...
       'Classe 3', 'Classe 3*', 'Location', 'northwest')       

hold off

%}

figure(5)

hold on

title('Posicao dos pesos w_{in}');

plot(pos_winner_1(:,1),pos_winner_1(:,2),'r*');
plot(pos_winner_2(:,1),pos_winner_2(:,2),'b+');        
plot(pos_winner_3(:,1),pos_winner_3(:,2),'kx');
xlabel('Comprimento da petala')
ylabel('Largura da petala')
legend('Classe 1', 'Classe 2', 'Classe 3', 'Location', 'northwest')       

hold off

%{

figure(6)

hold on

title('Posicao dos pesos w_{in}');

plot(pos_winner_1(:,1),pos_winner_1(:,3),'r*');
plot(pos_winner_2(:,1),pos_winner_2(:,3),'b+');        
plot(pos_winner_3(:,1),pos_winner_3(:,3),'kx');
xlabel('Comprimento da petala')
ylabel('Comprimento da sepala')
legend('Classe 1', 'Classe 2', 'Classe 3', 'Location', 'northwest')       

hold off

%}

%}

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
xlabel('Épocas de treinamento')
ylabel('Número de acertos')
legend('Classe 1', 'Classe 2', 'Classe 3', 'Location', 'southeast')       

hold off

