%Vector Prony Test with scalar fitting 

coefficient_mode_matrix=[1 5 9 ; 
                         2 6 11]; 
eigenvalues_without_congugate=[-0.6+0.5j 0.2+ 0.6j -0.4+0.2j]; 
[row_eig_length, column_eig_length]=size(eigenvalues_without_congugate); 
num_eigenvals=column_eig_length; 
[row_coeff_length, column_coeff_length]=size(coefficient_mode_matrix); 
num_signals=row_coeff_length;
time_step=1; 
num_samples=10; 
guess_num_modes=4; 
assert (guess_num_modes<11); 
noise_variance=0.0001; 


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
display(doubled_eigenvalues);
display(modeled_eigenvalues); 

plot((doubled_eigenvalues), 'o', 'MarkerSize', 10); hold on ; 
plot(modeled_eigenvalues, 'x', 'MarkerSize', 10); 












