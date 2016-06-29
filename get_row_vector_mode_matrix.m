function [ row_vector ] = get_row_vector_mode_matrix(t, roots)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
roots_size=size(roots);
length=roots_size(1); 
row_vector=[] ; 
for i=1 : length
    row_vector=[row_vector, (roots(i)^t)]; 
end

