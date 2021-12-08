# Math 466 Coding Project 2

# Adrian Samberg

using LinearAlgebra

#***Problem 1a***

A = [-0.49 -0.21 -0.40 -0.21
    0.36 0.10 0.29 -0.04
    0.12 -0.01 0.48 -0.47
    0.09 0.09 -0.41 0.22]

X0 = copy(A)

X1 = 0.5*(X0+transpose(inv(X0)))

norm(X0-X1) #Want this to be 16.37054203598731

#***Problem 1b***

#Now Make a vector v, each entry is a matrix with the (n-1)th iteration.
#v[1] = X0 etc.
v = Matrix{Float64}[]
push!(v, X0)
v[1] # X0

for i=2:11
    temp = 0.5*(v[i-1]+transpose(inv(v[i-1])))
    push!(v, temp)
    display(i-1)
    display(v[i])
end

delta = zeros(10) #values of the delta k's (delta[1] = delta 0 )etc.

for i=1:10
    display(i-1)
    delta[i] = norm(v[i+1]-v[i])
    display(delta[i])
end

#***Problem 1c***
# need to plot (delta[i],delta[i+1]) for i=2:9 (which is k=1:8)

alpha = (log(delta[10])-log(delta[9]))/(log(delta[9])-log(delta[8]))

#***Problem 1d***

v[9]'*v[9]
v[10]'*v[10]
v[11]'*v[11]