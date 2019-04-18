function [min_ max_] = minmax (matrix)
min_ = min(min(matrix));
max_ = max(max(matrix));
fprintf('The minimum of the matrix is %.2f\nThe maximum of the matrix is %.2f\n',min_,max_);
return;