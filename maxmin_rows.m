function [max_ min_] = maxmin_rows (X);
max_ = [max(max(X)) max(min(X))];
min_ = [min(max(X)) min(min(X))];
return;