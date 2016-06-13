function [normed_coeff_error ] = get_coeff_error(modeled_input_coefficients, m_model,  modeled_output_coefficients, n_model, input_coefficients, m, output_coefficients,n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

new_input_coefficients=zeros(max(m,m_model)); 
new_output_coefficients=zeros(max(n,n_model)); 

if m_model>m
     new_input_coefficients=extend(input_coefficients, m_model, m); 
     new_modeled_input_coefficients=modeled_input_coefficients; 
else
    if m>m_model
        new_modeled_input_coefficients=extend(modeled_input_coefficients, m, m_model); 
        new_input_coefficients=input_coefficients; 
        
    else
        new_input_coefficients=input_coefficients; 
        new_modeled_input_coefficients=modeled_input_coefficients; 
        
    end
end

if n_model>n
     [new_output_coefficients]=extend(output_coefficients, n_model, n); 
     [new_modeled_output_coefficients]=modeled_output_coefficients; 
else
    if n>n_model
        new_modeled_output_coefficients=extend(modeled_output_coefficients, n, n_model); 
        new_output_coefficients=output_coefficients; 
        
        
    else
        new_output_coefficients=output_coefficients; 
        new_modeled_output_coefficients=modeled_output_coefficients; 
        
    end
end

diff_output_vec=(new_output_coefficients-new_modeled_output_coefficients); 
diff_input_vec=(new_input_coefficients-new_modeled_input_coefficients); 
normed_coeff_error=norm(diff_output_vec)+norm(diff_input_vec); 


end

