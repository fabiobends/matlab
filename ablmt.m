function phrase = ablmt(string)
switch string
    case {'M', 'A', 'T', 'L', 'A', 'B'}
        phrase = 'MATLAB';
    case {'m', 'a', 't', 'l', 'a', 'b'}
        phrase = 'matlab';  
    otherwise
        phrase = 'I just don''t have it in me\n';
end        
        