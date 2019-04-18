function A = forward_backward(M,N)
for ii = 1:2:M
   for jj = 1:N
      A(ii,jj) = jj;
      if ii ~= M
         A(ii+1,jj) = N+1-jj;
      end
   end
end