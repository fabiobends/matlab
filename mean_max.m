function result = mean_max(A)
for ii = 1:size(A,1)
    result(ii,1).mean = double(mean(A(ii,:)));
    result(ii,1).max = max(A(ii,:));
end