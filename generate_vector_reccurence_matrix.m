function [ reccurence_matrix, reccurence_vector] = generate_vector_reccurence_matrix(data, num_samples, guess_num_modes, num_signals)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here


recc_vec_accum=[]; 
accum=[];
for t = 1 : (num_samples-guess_num_modes)-1
    %Add a matrix to accum(i, : , :)
    row_vector_matrix=get_matrix(data, guess_num_modes+t, guess_num_modes );  
    %display(row_vector_matrix)
    %display(accum); 
    accum(t ,: , :) = transpose(row_vector_matrix); 
    %display(accum)
    %display **************
    recc_vec_accum=[recc_vec_accum ; transpose((data(: , guess_num_modes+t)))]; 
end
num_recc_vec_rows=(num_samples-guess_num_modes)-1; 
reccurence_vector=recc_vec_accum; 

reccurence_matrix_accumulator=[]; 
for w= 1:num_recc_vec_rows 
    row_vector=[];
    for t=1:guess_num_modes
        addition=accum(w , t , :); 
        row_addition=get_row(addition, num_signals);
        row_vector=[row_vector , row_addition]; 
    end
    reccurence_matrix_accumulator=[reccurence_matrix_accumulator; row_vector]; 
end

reccurence_matrix=reccurence_matrix_accumulator; 
    
        
        
        
   












%flattened_reccurence_matrix=reshape(reccurence_matrix, 
%{

A = [5 7 8; 0 1 9; 4 3 6];
A(:,:,2) = [1 0 4; 3 5 6; 9 8 7]
A(:,:,1) =
     5     7     8
     0     1     9
     4     3     6

A(:,:,2) =
     1     0     4
     3     5     6
     9     8     7

%}
