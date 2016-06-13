%Test Script

number_of_trials=10; 
m=3;
n=4;
iterates=10;
input_coefficients=[1 , 2 ,3]; 
output_coefficients=[0.01 , -0.3 , -0.4 , 0.4];
%characteristic polynomials roots 0.8481    0.9264    0.9264    0.5496

noise_input_variance=0.00;
noise_input_mean = 0; 
noise_output_varaince=0.00000001; 
noise_output_mean=0.0; 
m_model=3; 
n_model=4; 




[input_data, output_data] = generate_data_fixed_param(m, n, iterates, input_coefficients, output_coefficients); 
%function [ modeled_input_coefficients, modeled_output_coefficients ] = Main_3_Function(number_of_trials, iterates, noise_input_variance,  noise_input_mean, noise_output_variance, noise_output_mean, m_model, n_model, m , n , input_data, output_data  )
[modeled_input_coefficients, modeled_output_coefficients ] = Main_3_Function(number_of_trials, iterates, noise_input_variance, noise_input_mean, noise_output_varaince, noise_output_mean, m_model, n_model, m , n , input_data, output_data); 

display(input_coefficients); 
display(output_coefficients);
%display(modeled_input_coefficients); 
display(modeled_output_coefficients); 
t=get_eigenvals(modeled_output_coefficients); 
display(t); 
length=size(t); 
normed_vals=[];
for i=1:length(1)
    normed_vals(i)=abs(t(i)); 
end
display(normed_vals); 

    


