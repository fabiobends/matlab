function A = even_indices(n,m)

A(1:n,1:m) = 0;
A(2:2:n,2:2:m) = 1;

 