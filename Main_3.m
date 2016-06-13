%Main 3

points=10;
noise_vals=zeros(1, points); 
mean_variance_vals=zeros(1,points); 
noise_step=0.000001;



m=2; 
n=3; 
iterates=5; 
m_model=2; 
n_model=4; 

[input_data, output_data, input_coefficients, output_coefficients] = generate_data(m, n, iterates);
g=size(input_coefficients); 
h=size(output_coefficients);
actual_coefficients=zeros(g(2)+h(2)); 
coeff_error_points=[]; 


for i=1:points
noise_calc=noise_step*i; 
    
number_of_trials=100;

noise_input_variance=noise_calc;
noise_input_mean=0; 
noise_output_variance=noise_calc; 
noise_output_mean=0; 
error_coefficients_accum=[]; 


%0 for no input noise, 1 for output noise
%0 for no input noise, 1 for no output noise

%display(input_data); 
%display(output_data);

[error_input_data, error_output_data]=generate_data_2(input_data, output_data, iterates, noise_input_variance, noise_input_mean, noise_output_variance, noise_output_mean, m, n);
[error_coefficients, norm_error]= model_data(m_model, n_model, error_input_data, error_output_data);
%display(error_input_data); 
%display(error_output_data); 
%display (output_coefficients); 
%display(input_coefficients); 
%display(error_coefficients); 

for r=1:number_of_trials
    [error_input_data, error_output_data]=generate_data_2(input_data, output_data, iterates, noise_input_variance, noise_input_mean, noise_output_variance, noise_output_mean, m, n);
    
    [error_coefficients]= model_data(m_model, n_model, error_input_data, error_output_data); 
    
    error_coefficients_accum = cat(1, error_coefficients_accum, transpose(error_coefficients));
end
%display(error_coefficients_accum); 

w=size(error_coefficients_accum); 
length=w(2); 
analysis=zeros(2,length);

for y=1:length
    %display(error_coefficients_accum(:,i));
    analysis(1, y)=mean(error_coefficients_accum(:,y)); 
    analysis(2, y)=var(error_coefficients_accum(:,y));
end
coefficients=analysis(1,:); 
y=size(coefficients); 
n_model=3; 
modeled_input_coefficients=zeros(1, m_model); 
modeled_output_coefficients=zeros(1,n_model);

for u=1:n_model+m_model
    if u<=m_model
       %display(m_model-u+1); 
        modeled_input_coefficients(1, u)=coefficients(1,m_model-u+1); 
    else
        display(modeled_output_coefficients); 
        modeled_output_coefficients(1, u-m_model)=coefficients(1,m_model+n_model-u+m_model+1); 
        
    end
   
end

coeff_error=get_coeff_error(modeled_input_coefficients, m_model,  modeled_output_coefficients, n_model, input_coefficients, m, output_coefficients, n); 


%get_coeff_error(modeled_input_coefficients, m_model,  modeled_output_coefficients, n_model, input_coefficients, m, output_coefficients,n)
mean_variance = mean(analysis(2, :)); 




%display(analysis(1,:)); 

display(coefficients); 
display(coeff_error); 
display(input_coefficients);
display(output_coefficients); 
display(modeled_input_coefficients);
display(modeled_output_coefficients); 

coeff_error_points(1 ,i)=coeff_error; 
noise_vals(1, i)=noise_calc; 
mean_variance_vals(1,i)=mean_variance; 

end



%display(noise_vals); 
%display(mean_variance_vals); 

%plot(noise_vals, mean_variance_vals); 
plot(noise_vals, coeff_error_points); 
















