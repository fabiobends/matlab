function matrix = cancel_middle (A,k)
matrix = A;
matrix(((end-k)/2+1):(end-k)/2+k,((end-k)/2+1):(end-k)/2+k)=0;
return;