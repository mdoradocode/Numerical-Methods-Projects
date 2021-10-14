using DelimitedFiles

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
    #Uncomment this line if you want to display the matrix being read on this iteration
    #display(A)
    return A
end

#This function returns one matrix from the prog1c.txt file
function readFileC(fp)
    global d
    a = readline(fp)
    if a === ""
        display("Here")
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
    #Uncomment this line if you want to display the matrix being read on this iteration
    #display(A)
    return A
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

