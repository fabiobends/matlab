function [row matrix] = randi_test (maxi, n)
rng(1);
matrix = randi(maxi,n);
rng(1);
row = randi(maxi,1,n^2);