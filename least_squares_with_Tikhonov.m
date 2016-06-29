function [ coeff ] = least_squares_with_Tikhonov(matrix_1, target_matrix, direction_matrix, epsilon)
%UNTITLED Summary of this function goes here
%   This takes the form matrix_1/target_matrix. direction_matrix must be
%   square. 

t=size(matrix_1); 
columns=t(2); 
[dir_rows, dir_columns]=size(direction_matrix); 
assert (columns==dir_columns) ; 
assert (dir_rows==dir_columns); 
b_extension_columns=size(target_matrix); 
zero_columns=b_extension_columns(2); 
left_matrix=[matrix_1; epsilon*direction_matrix]; 


bottom=zeros(columns, zero_columns); 
right_matrix=[target_matrix; bottom];

display(left_matrix); 
display(right_matrix); 
coeff=left_matrix\right_matrix; 


end

