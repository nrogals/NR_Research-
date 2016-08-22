%The script characterizes how many samples need to be taken under given
%noise conditions such that the variance of a mode is within a certain
%tolerance in vector prony. 

coefficient_mode_matrix=[1  ; 
                         1 ]; 
eigenvalues_without_congugate=[0.001]; 
[row_eig_length, column_eig_length]=size(eigenvalues_without_congugate); 
num_eigenvals=column_eig_length; 
[row_coeff_length, column_coeff_length]=size(coefficient_mode_matrix); 
num_signals=row_coeff_length;
time_step=1; 

guess_num_modes=1; 
assert (guess_num_modes<11);

mode_variance_tolerance=0.01; 
noise_multiplier=10; 
noise_varaiances=[]; 
num_samples_required=[]; 
number_trials=50; 
noise_steps=25; 
initial_noise_variance=0.0001;

noise_start=0.0001;
noise_end=2; 

noise_variances=linspace(noise_start, noise_end, noise_steps); 
for s = 1 : noise_steps


noise_variance=noise_variances(s); 


mean_variance_list=[]; 
tolerance_not_met=true;
num_samples=4;

while tolerance_not_met

for r = 1 : number_trials
    flag='Normal';
    data=get_data( coefficient_mode_matrix, eigenvalues_without_congugate, num_signals, num_eigenvals, time_step, num_samples, noise_variance, flag);



    tikhonov_epsilon=0.00000000000000001;
    [mode_matrix, modeled_eigenvalues] = vector_prony_with_scalar_fitting(data, guess_num_modes, tikhonov_epsilon); 


    doubled_coefficient_mode_matrix=[]; 
    doubled_eigenvalues=[]; 
    [num_rows, num_eigenvectors]=size(coefficient_mode_matrix); 
    for i=1:num_eigenvectors
        doubled_eigenvalues=[doubled_eigenvalues eigenvalues_without_congugate(:, i), conj(eigenvalues_without_congugate(:, i))]; 
    end
    
    mean_variance_list(r)=modeled_eigenvalues; 

end
display(mean_variance_list); 
display(noise_variance); 
%assert(s<2); 
variance=var(mean_variance_list); 
display(variance); 



if variance<mode_variance_tolerance
    tolerance_not_met=false; 
end

num_samples=num_samples+1; 

end
num_samples_required=[num_samples_required num_samples]; 
noise_varaiances=[noise_varaiances noise_variance];  

end

display(num_samples_required);
display(noise_varaiances); 
plot(noise_varaiances, num_samples); 

