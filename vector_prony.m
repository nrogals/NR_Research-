function [coefficient_mode_matrix, eigenvalues] = vector_prony(data , num_samples, guess_num_modes); 
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
%data is a matrix where the p,t entry is the pth measurement at time t
[recurrence_matrix, recurrence_vector] = generate_vector_reccurence_matrix(data, num_samples, guess_num_modes, num_signals); 
transpose_reccurence_matrix=permute(recurrence_matrix, [2 1 3]); 




end

