function [mode_matrix, eigenvalues, recurrence_matrix, recurrence_vector] = vector_prony(data , num_samples, guess_num_modes, num_signals) 
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
%data is a matrix where the p,t entry is the pth measurement at time t




[recurrence_matrix, recurrence_vector] = generate_vector_reccurence_matrix(data, num_samples, guess_num_modes, num_signals); 

display(recurrence_matrix); 
display(recurrence_vector); 

vector_coefficients=recurrence_matrix\recurrence_vector;

display(vector_coefficients); 


[coefficient_matricies, eigenvalues ] = get_eigenvalues( vector_coefficients, num_signals, guess_num_modes ) ; 

mode_matrix=coefficient_matricies; 





