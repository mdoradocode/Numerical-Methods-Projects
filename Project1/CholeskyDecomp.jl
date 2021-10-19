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

function nonDiagCase(A)
#k represents rows, i represents columns. j is our iterative variable
#outer row loop
if A[0,1] == [1,0]
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
    display(L)
else:
    println("Matrix not Symmetric")
end

function choleskyDecomp(A)
    for j=1:d-1
        for i=j+1:d
            if i != j
                nonDiagCase(A)                 #go to Matt's matrix math
            elseif i == j
                then
                k = i
                C=sqrt(A(j,j)- sum[L(i,k) * L(j,k) | k == [0:j-1]])
                L[i,j]=C
            end
        end
    end
end

#This 'open' function resides outside of the while loop to keep continuity of the variable 'fp'. If you were to call 'open' every time the while loop triggered, you would read the first matrix of the file for eternity
open("prog1b.txt","r") do fp
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

#This is part of the file reading for part e of the project
open("prog1c.txt", "r") do fp
    #This is the while loop to deal with the prog1c.txt file, it loops until the if statement is reached, which signals the end of the file has been reached
    while true
        #This 'A' variable is a nxn matrix read from the prog1b.dat.txt fil, moving sequentially through the file 
        A = readFileC(fp)
        #This line will break out of this while loop once the end of the file is reached
        if A == 99
            break
        end
        #Below this comment and within the while loop is where code from Maverick and Matt should go
    end
end

