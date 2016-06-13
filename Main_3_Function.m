function [ modeled_input_coefficients, modeled_output_coefficients ] = Main_3_Function(number_of_trials, iterates, noise_input_variance,  noise_input_mean, noise_output_variance, noise_output_mean, m_model, n_model, m , n , input_data, output_data  )
%UNTITLED2 Summary of this function goes here
%  This function acts like Main_3 except it is not in a interactive form
%  but rather allows all parameters to be placed in as arguments to
%  function. Used in Tests. 

error_coefficients_accum=[]; 
for r=1:number_of_trials
    [error_input_data, error_output_data]=generate_data_2(input_data, output_data, iterates, noise_input_variance, noise_input_mean, noise_output_variance, noise_output_mean, m, n);
    [error_coefficients]= model_data(m_model, n_model, error_input_data, error_output_data);
    %display(error_coefficients);
    error_coefficients_accum = cat(1, error_coefficients_accum, transpose(error_coefficients));
end

w=size(error_coefficients_accum); 
length=w(2); 
analysis=zeros(2,length);

for y=1:length
    %display(error_coefficients_accum(:,i));
    analysis(1, y)=mean(error_coefficients_accum(:,y)); 
    analysis(2, y)=var(error_coefficients_accum(:,y));
end
coefficients=analysis(1,:); 
display(coefficients); 
y=size(coefficients); 
%n_model=3; 
modeled_input_coefficients=zeros(1, m_model); 
modeled_output_coefficients=zeros(1,n_model);

for u=1:(n_model+m_model)
    if u<=m_model
       %display(m_model-u+1); 
        modeled_input_coefficients(1, u)=coefficients(1,m_model-u+1); 
    else
        %display(modeled_output_coefficients); 
        modeled_output_coefficients(1, u-m_model)=coefficients(1,m_model+n_model-u+m_model+1); 
        
    end
    
end



