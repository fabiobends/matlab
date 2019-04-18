function matrix = alternate (rows, columns) 
matrix(1:2:columns,1:2:rows) = 1;
matrix(2:2:columns,2:2:rows) = 1;
return;