function [total gain] = compound (sum, interest, years)
gain = sum*(1+interest/100)^years;
total = sum + gain;
return;