function [ x_accum ] = Huber_Loss_Function_Function( A , B , fun_handle, x0 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[num_rows, num_columns]=size(B); 


x_accum=[]; 
for i = 1 : num_columns
    b=B(:, i); 
    x_i=fmincon(@(x)Huber_weigting_function(A*x-b, fun_handle),x0,[],[]);
    x_accum=[x_accum x_i];
    
end

