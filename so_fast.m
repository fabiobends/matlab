function A = so_fast(N);
A = zeros(N);
for jj = 1:N
    for ii = 1:N
        A(ii,jj) = rand;
    end
end
