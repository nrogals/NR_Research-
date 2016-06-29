function [mode_matrix, eigenvalues, recurrence_matrix, recurrence_vector] = vector_prony(data , num_samples, guess_num_modes, num_signals, tikhonov_epsilon) 
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
%data is a matrix where the p,t entry is the pth measurement at time t




[recurrence_matrix, recurrence_vector] = generate_vector_reccurence_matrix(data, num_samples, guess_num_modes, num_signals); 

display(recurrence_matrix); 
display(recurrence_vector); 
[row_num, column_num]=size(recurrence_matrix); 
direction_matrix=eye(column_num); 
vector_coefficients=least_squares_with_Tikhonov(recurrence_matrix, recurrence_vector, direction_matrix, tikhonov_epsilon); 


display(vector_coefficients); 
[coefficient_matricies, roots ] = get_eigenvalues( vector_coefficients, num_signals, guess_num_modes ) ; 

eigenvalues=[]; 
for i = 1 : guess_num_modes
    eigenvalues(i)=log(roots(i)); 
end


mode_matrix=[]; 
observed_mode_vector = [] ; 
for t = 1:num_samples
    row_vector=get_row_vector_mode_matrix(t, roots); 
    mode_matrix=[mode_matrix; row_vector];
    observed_mode_vector=[observed_mode_vector ; transpose(data(: , t))]; 
end
[num_rows,num_columns]=size(mode_matrix); 
direction_matrix=eye(num_columns); 
modes=least_squares_with_Tikhonov(mode_matrix, observed_mode_vector, direction_matrix, tikhonov_epsilon); 



display(modes); 
    
    
    
end






