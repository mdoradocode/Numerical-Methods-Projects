using LinearAlgebra

#create some positive definite matrix
A=[1 2; 2 3]
display(A)
n=size(A)[1]
#creation of L matrix 
L=zeros(n,n)

#k represents rows, i represents columns. j is our iterative variable
#outer row loop
for k=1:n
    #inner column loop
    for i=1:n
        #if below diag
        if k>i
            s=0
            #creation of element L[k,i]
            for j=1:i-1
                s+=L[i,j]*L[k,j]
            end
            L[k,i]=(A[k,i]-s)/L[i,i]
        #if on diagonal
        elseif k==i
            s=0
            #creation of element L[k,k]
            for j=1:k-1
                s+=L[k,j]*L[k,j]
            end
            L[k,k]=sqrt(A[k,k]-s)
        end
    end
end

display(L)
display(L*L')