using LinearAlgebra

#create some positive definite matrix
A=[2 1; 1 2]
display(A)
n=size(A)[1]
L=zeros(n,n)
#k represents rows, i represents columns. j is our iterative variable
for k=1:n
    for i=1:n
        if k>i
            s=0
            for j=1:i-1
                s+=L[i,j]*L[k,j]
            end
            L[k,i]=(A[k,i]-s)/L[i,i]
        elseif k==i
            s=0
            for j=1:k-1
                s+=L[k,j]*L[k,j]
            end
            L[k,k]=sqrt(A[k,k]-s)
        end
    end
end

display(L)