function [ sum ] = Huber_weigting_function(x , fun_handle)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

%x is a vector 

d=100; 
[num_rows, num_columns]=size(x); 

sum=0; 
for i = 1 : num_rows
    a=x(i);
    output_val=fun_handle(a); 
    
    sum=sum+output_val; 
end






