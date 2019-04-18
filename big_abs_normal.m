function n = big_abs_normal(d)
n = 1;
while abs(randn)<d
    n = n + 1;
end    