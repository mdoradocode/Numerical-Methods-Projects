# Math 466 Coding Project 2

# Adrian Samberg
using Pkg
using LinearAlgebra
using Plots

#***Problem 1a***

println("Problem 1a: ")
A = [-0.49 -0.21 -0.40 -0.21
    0.36 0.10 0.29 -0.04
    0.12 -0.01 0.48 -0.47
    0.09 0.09 -0.41 0.22]

X0 = copy(A)

X1 = 0.5*(X0+transpose(inv(X0)))

print("Frobenius Norm: ")
println(norm(X0-X1)) #Want this to be 16.37054203598731
print("\n")
#***Problem 1b***

println("Problem 1b: ")
#Now Make a vector v, each entry is a matrix with the (n-1)th iteration.
#v[1] = X0 etc.
v = Matrix{Float64}[]
push!(v, X0)
v[1] # X0

for i=2:11
    temp = 0.5*(v[i-1]+transpose(inv(v[i-1])))
    push!(v, temp)
    #display(i-1)
    #display(v[i])
end

delta = zeros(10) #values of the delta k's (delta[1] = delta 0 )etc.

for i=1:10
    
    
    delta[i] = norm(v[i+1]-v[i])
    print("Delta, index ")
    print(i-1)
    print(", is = ")
    display(delta[i])
end
print("\n")

#***Problem 1c***
# need to plot (delta[i],delta[i+1]) for i=2:9 (which is k=1:8)

println("Problem 1c: ")
alpha = (log(delta[10])-log(delta[9]))/(log(delta[9])-log(delta[8]))
deltaX = zeros(9)
deltaY = zeros(9)
for i=1:9
    global deltaX, delta
    deltaX[i] = delta[i]
end
#println(deltaX)

for i=1:9
    global deltaY, delta
    deltaY[i] = delta[i+1]
end
#println(deltaY)

display(plot(deltaX,deltaY))

print("Alpha is = ")
println(alpha)
print("\n")

#***Problem 1d***

println("Problem 1d: ")
println("K = 8: ")
display(v[9]'*v[9])
println("K = 9: ")
display(v[10]'*v[10])
println("K = 10: ")
display(v[11]'*v[11])
print("\n")

#***Problem 1e***
println("Problem 1e: ")
W = v[11]

Winv  = inv(W)

P = Winv * A
println("Eigenvalues of A are: ")
display(eigvals(A))
println("\nEigenvalues of P are: ")
display(eigvals(P))