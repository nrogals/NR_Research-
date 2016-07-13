function [ projcetion_A_onto_C_along_B ] = oblique_projection(A , B , C )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

pseudo_inverse=pinv([C ; B] * [transpose(C) transpose(B)]); 
[num_rows , num_columns]=size(C); 
mid_matrix=pseudo_inverse(1:num_columns, :); 

projcetion_A_onto_C_along_B=A*[transpose(C) transpose(B)] * mid_matrix* C; 


end

