function B = safe_int8(A)
[in jn] = size(A);
for ii = 1:in
    for jj = 1:jn
        if int8(A(ii,jj)) ~= A(ii,jj)
        B = A;    
        break;
        else
        B(ii,jj) = int8(A(ii,jj));
        end
    end
end    

%{
function A_out = safe_int8(A_in)
d = max(abs(A_in(:) - fix( A_in(:)))); % maximum fractional part
if d ~= 0 || min(A_in(:)) < intmin('int8') || max(A_in(:)) > intmax('int8')
   A_out = A_in; % return the same type
else
   A_out = int8(A_in);
end
%}