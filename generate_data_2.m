%This file does analysis on linear system where there is error generated 

function [error_input_data, error_output_data] = generate_data_2(input_data, output_data, iterates, noise_variance_input, noise_input_mean, noise_variance_output, noise_output_mean, m , n)

t=size(input_data); 
error_input_data=zeros(1, t(2));
error_output_data=zeros(1, t(2));

for i=1:t(2)
    error_input_data(i)=get_noisy_val(input_data(i), noise_input_mean, noise_variance_input);
    error_output_data(i)=get_noisy_val(output_data(i), noise_output_mean, noise_variance_output); 
    
    


    
end 

