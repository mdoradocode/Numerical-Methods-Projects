rows,cols=size(L)               #from the reading of matrix (L) or whatever letter we are using for storing the matrix

a[i,j] = copy(L)
L=Matrix{Float16}(I,rows,cols)  #storing the matrix for the cholesky

for j=1:cols-1
    for i=j+1:rows
        if i != j
            then                 #go to Matt's matrix math
            
        if i == j
            then
            k = i
            C=sqrt(a(j,j)- sum[L(i,k) * L(j,k) | k == [0:j-1]])
            L[i,j]=C
    end
end