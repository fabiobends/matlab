function s = my_size(matrix)
s = size(matrix);
[row columns] = size(matrix);
fprintf('This is a %d-by-%d matrix', row, columns);
return;