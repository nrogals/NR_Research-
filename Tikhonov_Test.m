
A=[1 2 3-8 ; 4 -5 6 ; -7 8 9]; 
b=[1 8; 2 5; 8 9]; 
x=A\b; 
display(x); 
direction_matrix=eye(3); 
epsilon=0.000000000000000000001; 

y=least_squares_with_Tikhonov(A, b, direction_matrix, epsilon); 
display(y); 