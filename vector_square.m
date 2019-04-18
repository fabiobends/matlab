function vector_2 = vector_square(vector_1) 
vector_2=zeros(1,length(vector_1));
i=0;
for i = 1:length(vector_1)
    vector_2(i)= (vector_1(i))^2;
end    