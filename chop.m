function [matrixout] = chop(matrixin)
[numrow,numcol] = size(matrixin);
if numcol ~= 1 || numrow ~= 3
    fprintf('Invalid input!');
    matrixout = [0; 0; 0];
end
    
    

