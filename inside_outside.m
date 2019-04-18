function inside_outside(x,y,z)
if (y >= x && y <= z) || (y <= x && y >= z)
    fprintf('Inside\n');
else    
    fprintf('Outside\n');
end    