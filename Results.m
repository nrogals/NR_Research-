coefficient_mode_matrix=[1 3 ; 
                         2 4 ]; 
eigenvalues_without_congugate=[-0.6+8j -0.2+ 0.5j]; 
num_eigenvals=2; 
num_signals=2;
time_step=1; 
num_samples=15; 
guess_num_modes=2; 
noise_variance=0.1;  
number_of_iterates=1000;



vector_prony_error=[]; 
n4sid_SSARX_error=[]; 
n4sid_MOESP_error=[]; 
n4sid_cva_error=[]; 




for i= 1 : number_of_iterates 
    %Get data; 
    [samples,time_samples]=get_data(coefficient_mode_matrix, eigenvalues_without_congugate, num_signals, num_eigenvals, time_step, num_samples, noise_variance);
    data=transpose(samples); 
    
    [eigevnalues, eigenvectors]=n4sid_cva(output_data ); 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, eigenvalues_without_congugate, coefficient_mode_matrix); 
    n4sid_cva_error(i)=[eig_error; eig_vec_error];
    
    %each of the columns is an eigenvector; and there are an array of
    %eigenvalues
    [eigenvalues, eigenvectors]=n4sid_SSARX(output_data); 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, eigenvalues_without_congugate, coefficient_mode_matrix); 
    n4sid_SSARX_error(i)=[eig_error; eig_vec_error];
    
    
    [eigenvalues, eigenvectors]=n4sid_MOESP(output_data);
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, eigenvalues_without_congugate, coefficient_mode_matrix); 
    n4sid_MOESP_error(i)=[eig_error; eig_vec_error]; 
    
    
    [mode_matrix, eigenvalues]=vector_prony(transpose(data), guess_num_modes, 0.00000000000000001); 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, eigenvalues_without_congugate, coefficient_mode_matrix); 
    vector_prony_error=[eig_error; eig_vec_error]; 
   
    
end