function [ reccurence_matrix_accum ] = flatten( reccurence_array , num_recc_vec_rows , num_signals, guess_num_modes )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

reccurence_matrix_accum=[]; 
display(num_signals);
for sample_num = 1:(num_recc_vec_rows*num_signals)
        sig_index=mod(sample_num, num_signals); 
        Q=floor(num_signals/sample_num); 
        sample_index=Q+1; 
        row_vector=zeros(1, num_signals*num_signals*guess_num_modes); 
        display(sig_index); 
        updated_row=get_row_vector(reccurence_array, row_vector, sig_index, sample_index, guess_num_modes, num_signals); 
        
        reccurence_matrix_accum=[reccurence_matrix_accum;updated_row]; 
end

        
