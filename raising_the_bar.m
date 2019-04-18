function s2 = raising_the_bar(s1)
s2 = s1;
s2(s2=='_') = '-';


%{
function s2 = raising_the_bar(s1)
finalindex = size(s1,2);
s2 = s1;
for ii = 1:finalindex
    if double(s1(ii)) == 95;
    s2(ii) = char(45);
    end
end
%}