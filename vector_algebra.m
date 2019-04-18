function a = vector_algebra(x,y,z) 
i=0;
for i = 1:length(x)
    a(i)= x(i)^2+y(i)*z(i);
end    