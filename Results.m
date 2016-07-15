coefficient_mode_matrix=[1 3 ; 
                         2 4 ]; 
eigenvalues_without_congugate=[-0.6+8j -0.2+ 0.5j]; 
num_eigenvals=2; 
num_signals=2;
time_step=1; 
num_samples=15; 
guess_num_modes=2; 
noise_variance=0.0;  
number_of_iterates=1000;



vector_prony_error=[]; 



for i= 1 : number_of_iterates 
    %Get data; 
    data=get_data(coefficient_mode_matrix, eigenvalues_without_congugate, num_signals, num_eigenvals, time_step, num_samples, noise_variance);
    
    
    [modeled_mode_matrix, modeled_eigenvalues] = vector_prony(data , num_samples, guess_num_modes, num_signals, tikhonov_epsilon);  
    [mode_error, mode_shape_error]=calculate_mode_error(modeled_mode_matrix, coefficient_mode_matrix, eigenvalues, modeled_eigenvalues); 
    vector_prony_error=[mode_error; mode_shape_error]; 
    
    
    
    
    
end