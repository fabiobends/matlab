function [ea,max_ns] = exp_approx_sequence(u)
for ii = 1:length(u)
   nth_term = 1;
   total = 1;
   n = 0;
   while abs(nth_term) >= 1/1e4
      n = n + 1;
      nth_term = u(ii)^n/factorial(n);
      total = total + nth_term;
   end
   ea(ii) = total;
   max_ns(ii) = n;
end
