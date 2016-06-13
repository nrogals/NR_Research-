%This file calculates does numerous calculations to find the effect of
%white nosie on the system

number_of_trials=1000;

noise_input_bool=0; 
noise_output_bool=0; 
noise_input_variance=0.01;
noise_input_mean=0; 
noise_output_variance=0.01; 
noise_output_mean=0; 
error_coefficients_accum=[]; 


%0 for no input noise, 1 for output noise
%0 for no input noise, 1 for no output noise
m=2; 
n=3; 
iterates=5; 
m_model=2; 
n_model=3; 
 
[input_data, output_data, input_coefficients, output_coefficients] = generate_data(m, n, iterates);

[error_input_data, error_output_data]=generate_data_2(input_data, output_data, iterates, noise_input_variance, noise_input_mean, noise_output_variance, noise_output_mean, m, n);
[error_coefficients]= model_data(m_model, n_model, error_input_data, error_output_data);
display(error_input_data); 
%display(size(output_coefficients)); 

%error_coefficients_accum = cat(1, error_coefficients_accum, error_coefficients);

%for i=1:number_of_trials
    %[error_input_data, error_output_data]=generate_data_2(input_data, output_data, iterates, input_coefficients, output_coefficients, noise_input_variance, noise_input_mean, noise_output_variance, noise_output_mean,  noise_input_bool, noise_output_bool, m, n); 
    
    %[error_coefficients]= model_data(m_model, n_model, error_input_data, error_output_data); 
    
    %error_coefficients_accum = cat(1, error_coefficients_accum, error_coefficients);
    
    
    
    

%end

%display(error_coefficients_accum); 


