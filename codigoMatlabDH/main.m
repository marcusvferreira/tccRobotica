% Codigo elaborado para o calculo das matrizes de transformacao homogenea
% referentes ao manipulador UR5, que foi construido a partir da impressao 3D na 
% proporcao 1:2
%
% Inicialmente, calcula-se todas as matrizes parciais de forma individual
% para, em seguida, multiplica-las sequencialmente e obter a matriz de transformacao 
% total da base ate a extremidade do manipulador
%
% Autor: Marcus Vinicius Ferreira, discente de Engenharia de Controle e Automacao
% na UFLA. Data: nov/2023

clc, clear, close all; % limpa a janela de comando e os dados armazenados anteriormente

%% Matrizes simbolicas
% Nesta secao, usa-se angulos simbolicos a fim de obter matrizes genericas,
% independentes dos valores numericos de tais angulos

syms theta1 theta2 theta3 theta4 theta5 theta6 % declaracao dos angulos simbolicos

% Para angulos simbolicos, deve-se os converter para graus, pois a funcao 'denavit' 
% utiliza essa unidade. Por isso o uso de (*180/pi) apos a variavel que representa 
% o theta. Alem disso, ressalta-se que a funcao denavit recebe os parametros da 
% seguinte forma: denavit(theta, d, a, alfa)
T01 = denavit(theta1*180/pi,0.07,0,90);
T12 = denavit(theta2*180/pi,0,-0.21,0);
T23 = denavit(theta3*180/pi,0,-0.20,0);
T34 = denavit(theta4*180/pi,0.05,0,90);
T45 = denavit(theta5*180/pi,0.05,0,-90);
T56 = denavit(theta6*180/pi,0.04,0,0);

% Multiplicacao sequencial da matrizes T0N (zero a N) ate a obtencao da 
% matriz simbolica de transformacao total
T01;
T02 = simplify(T01*T12);
T03 = simplify(T02*T23);
T04 = simplify(T03*T34);
T05 = simplify(T04*T45);
T06 = simplify(T05*T56) % exibe o resultado

%% Matrizes com valores angulares numericos
% Nesta secao, usa-se angulos com valores numericos a fim de obter matrizes 
% especificas para determinada posicao do manipulador. O resultado se apresenta
% como uma matriz 4x4, que contem a informacao da posicao e da orientacao

% Atencao: Aqui deve-se substituir com o valor desejado para cada um dos
% angulos (em graus)!
theta1n = 0; % angulo theta 1 numerico   
theta2n = -90; % angulo theta 2 numerico  
theta3n = -90; % angulo theta 3 numerico  
theta4n = 0; % angulo theta 4 numerico  
theta5n = 0; % angulo theta 5 numerico  
theta6n = 0; % angulo theta 6 numerico  

% Multiplicacao sequencial da matrizes T0N (zero a N) ate a obtencao da 
% matriz transformacao total. A funcao denavit recebe os parametros
% da seguinte forma: denavit(theta, d, a, alfa)
T01 = denavit(theta1n,0.07,0,90);
T12 = denavit(theta2n,0,-0.21,0);
T23 = denavit(theta3n,0,-0.20,0);
T34 = denavit(theta4n,0.05,0,90);
T45 = denavit(theta5n,0.05,0,-90);
T56 = denavit(theta6n,0.04,0,0);

% Multiplicacao sequencial da matrizes numericas T0N (zero a N) ate 
% a obtencao da matriz de transformacao total
T01;
T02 = T01*T12;
T03 = T02*T23;
T04 = T03*T34;
T05 = T04*T45;
T06 = T05*T56 % exibe o resultado