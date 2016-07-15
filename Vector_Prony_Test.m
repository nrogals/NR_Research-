%Test script



coefficient_mode_matrix=[1 3 ; 
                         2 4 ]; 
eigenvalues_without_congugate=[-0.6+8j -0.2+ 0.5j]; 
num_eigenvals=2; 
num_signals=2;
time_step=1; 
num_samples=15; 
guess_num_modes=2; 
noise_variance=0.00; 

%get_data( coefficient_mode_matrix, eigenvalues, num_signals, num_eigenvals, time_step, number_samples, noise_variance) 

data=get_data( coefficient_mode_matrix, eigenvalues_without_congugate, num_signals, num_eigenvals, time_step, num_samples, noise_variance);
num_signals=2; 
display(data);

tikhonov_epsilon=0.000000000000001;
[coefficient_mode_matrix, eigenvalues] = vector_prony(data, guess_num_modes, tikhonov_epsilon); 


 
 
 
 





