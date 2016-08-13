function [modes, eigenvalues] = vector_prony(data , order, tikhonov_epsilon) 
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
%data is a matrix where the p,t entry is the pth measurement at time t

[num_signals, num_samples]=size(data); 
guess_num_modes=order;

[recurrence_matrix, recurrence_vector] = generate_vector_reccurence_matrix(data, num_samples, guess_num_modes, num_signals); 

%display(recurrence_matrix); 
%display(recurrence_vector); 
[row_num, column_num]=size(recurrence_matrix); 
%direction_matrix=eye(column_num); 

direction_matrix=eye(column_num); 

direction_matrix=repmat(10, column_num); 
for i = 1 : column_num
    direction_matrix(i,i)=1; 
end


vector_coefficients=least_squares_with_Tikhonov(recurrence_matrix, recurrence_vector, direction_matrix, tikhonov_epsilon); 


%display(vector_coefficients); 
roots= get_eigenvalues( vector_coefficients, num_signals, guess_num_modes ) ; 

eigenvalues=[]; 
[num_rows, num_columns]=size(roots); 
for i = 1 : num_rows
    current_eigenvalue=log(roots(i)); 
    eigenvalues(i)=current_eigenvalue; 
end

mode_matrix=[]; 
observed_mode_vector = [] ; 
for t = 1:num_samples
    row_vector=get_row_vector_mode_matrix(t, roots); 
    mode_matrix=[mode_matrix; row_vector];
    observed_mode_vector=[observed_mode_vector ; transpose(data(: , t))]; 
end

%{
[num_rows,num_columns]=size(mode_matrix); 
direction_matrix=repmat(100000, num_columns); 
for i = 1 : num_columns
    direction_matrix(i,i)=1; 
end
%}

[num_rows,num_columns]=size(mode_matrix); 
direction_matrix=eye(num_columns); 

modes=least_squares_with_Tikhonov(mode_matrix, observed_mode_vector, direction_matrix, tikhonov_epsilon); 
modes=transpose(modes); 

end





