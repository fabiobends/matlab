%function [column matrix] = rand_test(n)
%matrix = rand(n,n);
%column(1:n,1) = matrix(:,n);
%return;

function [M N] = rand_test(n)
rng(1);
M = rand(n^2,1);
rng(1);
N = rand(n);