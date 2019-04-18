function ca = cosine_approx(a,N)
ca = 0;
for ii = 0:N
   ca = ca + (-1)^ii*a^(2*ii)/factorial(2*ii);
end