W = [1 2 3 4]
[s, p] = addproduct(W)

A=[1 2 0;3 0 4;5 6 0]
[s, p] = addproduct(A)

max(A)
mean(A)  %The mean by column
std(A)  %The standard deviation by column

res=cumsum(W)  %Accumulated summ of elements
res=cumprod(W) %Accumulated product of elements

V3 = rand(1,7)
V3 = sort(V3)

V4 = rand(4)
V4 = sort(V4, 1)  %sort elements of every column
V4 = sort(V4, 2)  %sort elements of every row

