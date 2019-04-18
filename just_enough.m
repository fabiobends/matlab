function n = just_enough(x,N)
n = 0;
while n*exp(x) < N^x
   n = n + 1;
end 