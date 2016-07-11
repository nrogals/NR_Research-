function [input_data, output_data, states ] = Linear_System_Data_Gen(A, B, C, D, x0, iterates, input_vec_length)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

state=x0; 
input_data=[]; 
output_data=[]; 
states=x0; 
for i=1:iterates
    input=randn(input_vec_length , 1);
    observed_state=C*state+D*input; 
    state=A*state+B*input; 


    states=[states; state ]; 
    input_data=[input_data; transpose(input)]; 
    output_data=[output_data; transpose(observed_state)];  
end
