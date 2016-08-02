coefficient_mode_matrix=[8 4 ; 
                         -7 16 ]; 
eigenvalues_without_congugate=[-0.1+0.6j -0.05+ 0.3j]; 
num_eigenvals=2; 
num_signals=2;
time_step=1; 
num_samples=75; 
guess_num_modes=2; 
  
number_of_iterates=3;
n4sid_cva_error_eigenvalues_list=[]; 
n4sid_cva_error_mean_eigenvector_list=[]; 
n4sid_SSARX_error_mean_eigenvector_list=[]; 
n4sid_SSARX_error_eigenvalues_list=[]; 
n4sid_MOESP_error_mean_eigenvector_list=[]; 
n4sid_MOESP_error_mean_eigenvalues_list=[]; 
n4sid_vector_prony_error_mean_eigenvector_list=[]; 
n4sid_vector_prony_error_mean_eigenvalue_list=[]; 

noise_variances=[]; 
intitial_noise_variance=0.00000000000001;
num_noise_steps=30; 

for i = 1:num_noise_steps
vector_prony_error=[]; 
n4sid_SSARX_error=[]; 
n4sid_MOESP_error=[]; 
n4sid_cva_error=[]; 
noise_variance=intitial_noise_variance*3.333^i; 
noise_variances(i)=(noise_variance); 

doubled_coefficient_mode_matrix=[]; 
doubled_eigenvalues=[]; 
[num_rows, num_eigenvectors]=size(coefficient_mode_matrix); 
for i=1:num_eigenvectors
    doubled_coefficient_mode_matrix=[doubled_coefficient_mode_matrix calculate_mode_shape_vector(coefficient_mode_matrix(:, i)), calculate_mode_shape_vector(coefficient_mode_matrix(:, i))]; 
    doubled_eigenvalues=[doubled_eigenvalues eigenvalues_without_congugate(:, i), conj(eigenvalues_without_congugate(:, i))]; 
end






for i= 1 : number_of_iterates 
    %Get data; 
    
    [samples,time_samples]=get_data(coefficient_mode_matrix, eigenvalues_without_congugate, num_signals, num_eigenvals, time_step, num_samples, noise_variance);
    data=(samples); 
    output_data=samples; 
    
    
    [eigenvalues, eigenvectors]=n4sid_cva(output_data ); 
    %display(eigenvalues); 
    %display(eigenvectors); 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
    %display(eig_error); 
    %display(eig_vec_error); 
    n4sid_cva_error=[n4sid_cva_error [eig_error; eig_vec_error]];
    
    %each of the columns is an eigenvector; and there are an array of
    %eigenvalues
    [eigenvalues, eigenvectors]=n4sid_SSARX(output_data); 
 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
   
    n4sid_SSARX_error=[n4sid_SSARX_error [eig_error; eig_vec_error]];
    
    %display(noise_variance); 
    %assert False; 
    [eigenvalues, eigenvectors]=n4sid_MOESP(output_data);
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
    n4sid_MOESP_error=[n4sid_MOESP_error [eig_error; eig_vec_error]]; 
    
    
    [eigenvectors, eigenvalues]=vector_prony((data), guess_num_modes, 0.00000000000000001); 
    [num_rows, num_columns]=size(eigenvectors); 
    mode_shape_eigenvectors=[]; 
    for r = 1 : num_columns
        mode_shape_eigenvectors=[mode_shape_eigenvectors calculate_mode_shape_vector(eigenvectors(:, r))]; 
    end
         
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, mode_shape_eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
    vector_prony_error=[eig_error; eig_vec_error]; 
    
    
end


n4sid_cva_error_mean_eigenvalues=mean(n4sid_cva_error(1, :)); 
n4sid_cva_error_mean_eigenvectors=mean(n4sid_cva_error(2, :)); 
n4sid_cva_error_eigenvalues_list=[n4sid_cva_error_mean_eigenvalues n4sid_cva_error_eigenvalues_list]; 
n4sid_cva_error_mean_eigenvector_list=[n4sid_cva_error_mean_eigenvectors n4sid_cva_error_mean_eigenvector_list]; 


n4sid_SSARX_error_error_mean_eigenvalues=mean(n4sid_SSARX_error(1, :)); 
n4sid_SSARX_error_mean_eigenvectors=mean(n4sid_SSARX_error(2, :)); 
n4sid_SSARX_error_eigenvalues_list=[n4sid_SSARX_error_error_mean_eigenvalues n4sid_SSARX_error_eigenvalues_list]; 
n4sid_SSARX_error_mean_eigenvector_list=[n4sid_SSARX_error_mean_eigenvectors n4sid_SSARX_error_mean_eigenvector_list]; 


n4sid_MOESP_error_mean_eigenvalues=mean(n4sid_MOESP_error(1, :)); 
n4sid_MOESP_error_mean_eigenvectors=mean(n4sid_MOESP_error(2, :)); 
n4sid_MOESP_error_mean_eigenvalues_list=[n4sid_MOESP_error_mean_eigenvalues n4sid_MOESP_error_mean_eigenvalues_list]; 
n4sid_MOESP_error_mean_eigenvector_list=[n4sid_MOESP_error_mean_eigenvectors n4sid_MOESP_error_mean_eigenvector_list];  


vector_prony_error_mean_eigenvalues=mean(vector_prony_error(1, :)); 
vector_prony_error_mean_eigenvectors=mean(vector_prony_error(2, :)); 
n4sid_vector_prony_error_mean_eigenvalue_list=[vector_prony_error_mean_eigenvalues n4sid_vector_prony_error_mean_eigenvalue_list]; 
n4sid_vector_prony_error_mean_eigenvector_list=[vector_prony_error_mean_eigenvectors n4sid_vector_prony_error_mean_eigenvector_list];

end 

noise_variances=(noise_variances); 

display(noise_variances); 

display(n4sid_SSARX_error_eigenvalues_list);
display(n4sid_MOESP_error_mean_eigenvalues_list); 
display(n4sid_cva_error_eigenvalues_list); 
display(n4sid_vector_prony_error_mean_eigenvalue_list);

display(n4sid_cva_error_mean_eigenvector_list); 
display(n4sid_SSARX_error_mean_eigenvector_list); 
display(n4sid_MOESP_error_mean_eigenvalues_list); 
display(n4sid_vector_prony_error_mean_eigenvector_list);

plot(noise_variances, n4sid_SSARX_error_eigenvalues_list, 'color', 'r'); hold on; 
plot(noise_variances, n4sid_MOESP_error_mean_eigenvalues_list, 'color', 'b'); hold on; 
plot (noise_variances, n4sid_MOESP_error_mean_eigenvalues_list, 'color', 'g'); hold on; 
plot(noise_variances, n4sid_vector_prony_error_mean_eigenvalue_list, 'color', 'y'); 

















   


