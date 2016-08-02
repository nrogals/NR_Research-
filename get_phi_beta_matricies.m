function [ matrix ] = get_phi_beta_matricies(block_matrix, indicator , index, num_phi_rows, num_beta_rows, p)
% indicator ==0 means you get a beta matrix

%display(index);
%display(block_matrix); 
%display(new_block_matrix); 

%assert (1<0); 

break_index= num_beta_rows*p; 
[num_rows, num_columns]=size(block_matrix); 


if indicator==0
    %We are looking for a Beta matrix. index=0...p-1. index=0 selects
    %beta_matrix B_1
    matrix=block_matrix(:, break_index-(index+1)*num_beta_rows+1:break_index-(index)*num_beta_rows); 
    
else
    %We are looking for a Phi matrix
    matrix= block_matrix(:, num_columns-(index+1)*num_phi_rows+1:num_columns-(index)*num_phi_rows); 
    
end

