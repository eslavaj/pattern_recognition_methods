% Some basic vector manipulation

v1 = [1 2 3 4 5 6];
v2 = [1, 2, 3, 4, 5, 6];
v3 = 1:1:6;
v4 = 1:1:6.7;
v6 = [1; 2; 3; 4; 5; 6];
v7 = v1';  %Transpose
length(v7)  %The leght or array

%List current defined variables:
who

%List current defined variables with attributes
whos

%Erase specific variables:
clear v1 v2
%Erase all current defined variables
clear all

% Matrix manipulation
A = [1 2 3; 4 5 6; 7 8 9; 10 11 12]
size(A)
B = A'
[d1 d2] = size(B)
rowsNbr = size(A,1)
columsNbr = size(A,2)
a = A(1,2)
%Matlab order Matrix elements by colums:
A(:)
b= A(5)
%Access to a specific line:
A(2,:)
%Access to specific lines:
A(2:4,:)
A=[1 2 0;3 0 4;5 6 0];B=[1 1 1;2 2 2;3 3 3];c=10;
c^3
A.^2  % 2-power each element of A
A+B
A-B
c*A   %Matrix by scalar multiplication
A*B   %Matrix multiplication
A.*B  %Element-wise multiplication
A./B  %Element-wise division

det(A) %determinant of A
inv(A) %inverse A

X = B/A %Solve the equation X*A = B, calculate B*inv(A)
det(B)  %Determinant of B (it's 0)
D = inv(B)
V = diag(A)
diag(V)
B=reshape(A,3,3)
A=rand(4,4)  %uniformally distributed 
A=randn(4,4)  %normal distributed 









