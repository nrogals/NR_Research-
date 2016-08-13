%Test script


%Test script




coefficient_mode_matrix=[1 3 9 ; 
                         2 4 11]; 
eigenvalues_without_congugate=[-0.6+3j -0.2+ 0.5j -0.4+0.2j]; 
[row_eig_length, column_eig_length]=size(eigenvalues_without_congugate); 
num_eigenvals=column_eig_length; 
[row_coeff_length, column_coeff_length]=size(coefficient_mode_matrix); 
num_signals=row_coeff_length;
time_step=1; 
num_samples=150; 
guess_num_modes=3; 
assert (guess_num_modes<11); 
noise_variance=0.0000; 

%get_data( coefficient_mode_matrix, eigenvalues, num_signals, num_eigenvals, time_step, number_samples, noise_variance) 
flag='Normal';
data=get_data( coefficient_mode_matrix, eigenvalues_without_congugate, num_signals, num_eigenvals, time_step, num_samples, noise_variance, flag);


tikhonov_epsilon=0.00000000000000001;
[mode_matrix, modeled_eigenvalues] = vector_prony_with_scalar_fitting( data , order, tikhonov_epsilon );  
%display(mode_matrix); 
display(modeled_eigenvalues); 
