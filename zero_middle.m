function matrix = zero_middle (A)
matrix = A;
matrix((end+1)/2,(end+1)/2)=0;
return;