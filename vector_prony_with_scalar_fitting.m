function [mode_matrix, modeled_eigenvalues]  = vector_prony_with_scalar_fitting( data , order, tikhonov_epsilon )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

[num_signals, num_samples]=size(data); 
guess_num_modes=order;

[recurrence_matrix, recurrence_vector] = generate_vector_reccurence_matrix_2(data, num_samples, guess_num_modes, num_signals); 

[row_num, column_num]=size(recurrence_matrix); 
%direction_matrix=eye(column_num); 

direction_matrix=eye(column_num); 


%direction_matrix=repmat(10, column_num); 
%for i = 1 : column_num
    %direction_matrix(i,i)=1; 
%end


vector_coefficients=least_squares_with_Tikhonov(recurrence_matrix, recurrence_vector, direction_matrix, tikhonov_epsilon); 
display(vector_coefficients); 
char_poly_roots=get_eigenvals((transpose(vector_coefficients))); 

display(char_poly_roots); 

modeled_eigenvalues=[];
[num_rows, num_columns]=size(char_poly_roots); 

for i = 1 : num_rows
    modeled_eigenvalues=[modeled_eigenvalues  log(char_poly_roots(i))];
end

roots_row_vector=transpose(char_poly_roots); 

mode_power_matrix=[]; 
output_matrix=[]; 

for i = 1 : num_samples
    mode_power_matrix=[mode_power_matrix ; (roots_row_vector.^i)]; 
    output_matrix=[output_matrix; transpose(data(:, i))]; 
end

modes=mode_power_matrix\output_matrix; 

mode_matrix=transpose(modes); 

end

