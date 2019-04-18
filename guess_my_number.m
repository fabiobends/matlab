function guess_my_number()

while 1 
    a = input('Try to guess my number: ');
    if a < 42
        fprintf('Higher\n'); 
    end    
    if a > 42
        fprintf('Lower\n');
    end    
    if a == 42
        fprintf('That''s it\n');
        break;
    end
end

