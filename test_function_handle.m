function [ output_vector ] = test_function_handle(beta , x)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

output_vector=[]; 
[num_rows, num_columns]=size(x); 

for i = 1 : num_rows
    output_value = (beta(1)*x(i , 1) + beta(2)*x(i, 1)^2+beta(3)*x(i, 1)^3)^beta(4);
    %(beta(1)*i + (beta(2)*i^2)+(beta(3)*i^3));
    output_vector=[output_vector; output_value]; 
end


