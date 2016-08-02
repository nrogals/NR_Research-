coefficient_mode_matrix=[1 3 ; 
                         2 4 ]; 
eigenvalues_without_congugate=[-0.6+3j -0.2+ 0.5j]; 
num_eigenvals=2; 
num_signals=2;
time_step=1; 
num_samples=120; 
guess_num_modes=2; 
noise_variance=0.0;  
number_of_iterates=1000;



vector_prony_error=[]; 
n4sid_SSARX_error=[]; 
n4sid_MOESP_error=[]; 
n4sid_cva_error=[]; 

doubled_coefficient_mode_matrix=[]; 
doubled_eigenvalues=[]; 
[num_rows, num_eigenvectors]=size(coefficient_mode_matrix); 
for i=1:num_eigenvectors
    doubled_coefficient_mode_matrix=[doubled_coefficient_mode_matrix coefficient_mode_matrix(:, i), coefficient_mode_matrix(:, i)]; 
    doubled_eigenvalues=[doubled_eigenvalues eigenvalues_without_congugate(:, i), conj(eigenvalues_without_congugate(:, i))]; 
end
display(doubled_coefficient_mode_matrix); 
display(doubled_eigenvalues); 


for i= 1 : number_of_iterates 
    %Get data; 
    [samples,time_samples]=get_data(coefficient_mode_matrix, eigenvalues_without_congugate, num_signals, num_eigenvals, time_step, num_samples, noise_variance);
    
    data=(samples); 
    output_data=samples; 
    
    
    [eigenvalues, eigenvectors]=n4sid_cva(output_data ); 
    display(eigenvalues); 
    display(eigenvectors); 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
   
    n4sid_cva_error(i)=[eig_error; eig_vec_error];
    
    %each of the columns is an eigenvector; and there are an array of
    %eigenvalues
    [eigenvalues, eigenvectors]=n4sid_SSARX(output_data); 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
    n4sid_SSARX_error(i)=[eig_error; eig_vec_error];
    
    
    [eigenvalues, eigenvectors]=n4sid_MOESP(output_data);
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
    n4sid_MOESP_error(i)=[eig_error; eig_vec_error]; 
    
    
    [eigenvectors, eigenvalues]=vector_prony(transpose(data), guess_num_modes, 0.00000000000000001); 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
    vector_prony_error=[eig_error; eig_vec_error]; 
   
    
end