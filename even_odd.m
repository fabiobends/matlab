function even_odd(x)
switch x
    case {1 3 5}
        fprintf('Odd\n');
    case {0 2 4}
        fprintf('Even\n');
    otherwise
        fprintf('Let me get back to you on that one.\n');
end