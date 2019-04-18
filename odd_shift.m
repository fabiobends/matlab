function s2 = odd_shift (s1, shift)
finalindex = size(s1,2);
s2 = s1;
for ii = 1:2:finalindex
s2(ii) = s1(ii)+12; 
end
