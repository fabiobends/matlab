function sa = sine_approx(a,N)
sa = 0;
for ii = 0:N
   sa = sa + (-1)^ii*a^(2*ii+1)/factorial(2*ii+1);
end