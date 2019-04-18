function a = is_between(x,y,z)
a = 1;
for i = 1:length(x)
    if ~((y(i) < x(i) && y(i) > z(i)) || (y(i) > x(i) && y(i) < z(i)))
        a = 0; 
    break;
    end
end    