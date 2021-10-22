using DelimitedFiles
using LinearAlgebra

#This function returns one matrix from the prog1b.txt file
function readFileB(fp)
    global d
    a = readline(fp)
    if a === ""
        return 99
    end
    d = parse(Int,a)
    A=zeros(d,d)
    for i = 1:d
        a = readline(fp)
        r = split(a, " ")
        s = (x-> parse(Float64,x)).(r)
        A[i,:] = s
    end
    a=readline(fp)
    return A
end

#This function returns one matrix from the prog1c.txt file
function readFileC(fp)
    global d
    a = readline(fp)
    if a === ""
        return 99
    end
    d = parse(Int,a)
    A=zeros(d,d)
    for i = 1:d
        a = readline(fp)
        a = lstrip(a)
        r = split(a, "   ")
        s = (x-> parse(Float64,x)).(r)
        A[i,:] = s
    end
    a=readline(fp)
    return A
end

function choleskyDecomp(A)
#k represents rows, i represents columns. j is our iterative variable
#outer row loop
    if A[1,2] == A[2,1] && isposdef(A)
        L=zeros(d,d)
        for k=1:d
            #inner column loop
            for i=1:d
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
        println('\n')
        print("L factorization of A: ")
        display(L)
    else
        println('\n')
        display("Matrix not Positive Definite!")
    end
end


#This 'open' function resides outside of the while loop to keep continuity of the variable 'fp'. If you were to call 'open' every time the while loop triggered, you would read the first matrix of the file for eternity
open("prog1b.txt","r") do fp
    print("-----------------------------------------------------------------------------------")
    print("\nThis set of answers correspond to part a-b: \nA matrix that is postive definite will be factored into its lower triangular matrix, where a matrix that is not positive definite will display the text 'Matrix not Positive Definite!'. ")

    #This is the while loop to deal with the prog1b.txt file, it loops until the if statement is reached, which signals the end of the file has been reached
    while true
            #This 'A' variable is a nxn matrix read from the prog1b.dat.txt fil, moving sequentially through the file 
            A = readFileB(fp)
            #This line will break out of this while loop once the end of the file is reached
            if A == 99
                break
            end
            #Below this comment and within the while loop is where code from Maverick and Matt should go
            choleskyDecomp(A)
    end
end

print('\n')

print("-----------------------------------------------------------------------------------")

print('\n')

#Part C code
print("This set of answers correspond to part c-d: \nThis section creates a random 3x3 matrix, makes it positive definite by multiplying it by its transpose, creates a cholesky factorization and seperates it into its different fields. Finally it displays the error of the algo by zubtracting the factorization by the original matrix.\n\n")
A=rand(3,3)
B=A'*A
z=cholesky(B)
print("This is the cholesky factorization of the original matrix\n")
display(z)
print('\n')
print("These are the fields that exist within the cholesky factorization variable\n")
fields = propertynames(z)
display(fields)
print("\nThis is the matrix made from the multiplying the factorizations together and subtracting them from the original matrix\n")
display(z.L*z.U-B)
print("\nThe error of this operation is: ")
display(norm(z.L*z.U-B))
print("\nThis is our answer to the question posed at the end of part d:\nWhat line 116 {display(z.Lz.U-B)} computes is the difference between our positive definite matrix B and its  LU which in theory should result in B. In practice we see that there are non-zero elements in the difference which means that LU != B. The norm of this difference is analogous to the “length” or distance (LU-B) is from zero.\n\n")

#This is part of the file reading for part e of the project
open("prog1c.txt", "r") do fp
    #This is the while loop to deal with the prog1c.txt file, it loops until the if statement is reached, which signals the end of the file has been reached
    print("-----------------------------------------------------------------------------------\n")
    print("This set of answers correspond to part e: \nThis section reads in a set of matrices and uses the julia function 'cholesky' to factor them out as well as determine if they are positive definite matrices. If they are not positive definite matrices, it will display 'Matrix not Positive Definite!'. Otherwise it will display the L factorization. \n\n")
    while true
        #This 'A' variable is a nxn matrix read from the prog1b.dat.txt fil, moving sequentially through the file 
        A = readFileC(fp)
        #This line will break out of this while loop once the end of the file is reached
        if A == 99
            break
        end
        #Below this comment and within the while loop is where code from Maverick and Matt should go
        if isposdef(A)
            print("\nL factorization of matrix A:\n")
            display(cholesky(A).L)
        else
            print('\n')
            display("Matrix not Positive Definite!")
        end
    end
end

