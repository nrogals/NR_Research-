%Test script



coefficient_mode_matrix=[1 3 ; 
                         2 4 ]; 
eigenvalues_without_congugate=[-0.6+8j -0.2+ 0.5j]; 
num_eigenvals=2; 
num_signals=2;
time_step=1; 
num_samples=15; 
guess_num_modes=2; 



data=get_data( coefficient_mode_matrix, eigenvalues_without_congugate, num_signals, num_eigenvals, time_step, num_samples);
num_signals=2; 


[coefficient_mode_matrix, eigenvalues, reccurence_matrix, reccurence_vector] = vector_prony(data , num_samples, guess_num_modes, num_signals); 


 
 
 
 





