% Criada por L'Oiseau
% Função que cria uma matriz composta por outras matriz de zeros e uns
% rows = linhas; columns = colunas (a mais é dobrada em magnitude)

% function blocks(rows, columns) // Nutella
% matrix = [zeros(rows, columns) ones(rows, columns); ones(rows, columns) zeros(rows, columns)]

function blocks(rows, columns) % // Raiz
 vector_1 =  1:1:rows;
 vector_2 =  0:1:rows-1;
 row_ones = (vector_1 - vector_2)';
 matrix_ones = repmat(row_ones,1,columns);
 matrix_zeros = 0*matrix_ones;
 matrix = [matrix_zeros matrix_ones; matrix_ones matrix_zeros]