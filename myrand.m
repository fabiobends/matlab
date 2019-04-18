function [matrix, s] = myrand(high, low)
matrix = (high-low)*rand(3,4)+low;
s = sum(matrix);
end