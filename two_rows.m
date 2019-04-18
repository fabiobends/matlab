%function matrix = two_rows(matrix)
%if ndims(matrix) == 2
%    matrix
%else
%    fprintf('I must have two dimensions and two rows!\n');
%end
%

function A = two_rows(A)
[nrows,~] = size(A);    
if  ndims(A)~= 2 || nrows ~= 2
   fprintf('I must have two dimensions and two rows!');
   A = 0*A;
end
   