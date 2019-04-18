function a = bolt_check(mlength)
f = 0.98; % 2% less
F = 1.02; % 2% more
nlength = [3/8,1/2,5/8,3/4,1];
a = 0; % guess that test will fail
ii = 1;
if mlength >= f*nlength(ii) && mlength <= F*nlength(ii)
   a = nlength(ii);
end
ii = 2;
if mlength >= f*nlength(ii) && mlength <= F*nlength(ii)
   a = nlength(ii);
end
ii = 3;
if mlength >= f*nlength(ii) && mlength <= F*nlength(ii)
   a = nlength(ii);
end
ii = 4;
if mlength >= f*nlength(ii) && mlength <= F*nlength(ii)
   a = nlength(ii);
end
ii = 5;
if mlength >= f*nlength(ii) && mlength <= F*nlength(ii)
   a = nlength(ii);
end