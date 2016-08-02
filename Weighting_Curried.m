function [ error_val ] = Weighting_Curried( fun_handle, A,  b , x)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


[num_rows, num_columns]=size(A); 
residual=A*x-b; 


error_val=0; 

for i = 1 : num_rows
    error_val_add=fun_handle(residual(i)); 
    error_val=error_val+error_val_add; 
end



