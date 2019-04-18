function A = make_waves(M,N)
for ii = 1:N
   for jj = 1:N
      A(ii,jj) = sin(M*2*pi*ii/N)*sin(M*2*pi*jj/N);
   end
end