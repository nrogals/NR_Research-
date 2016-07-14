function [ projcetion_A_onto_C_along_B ] = oblique_projection(A , B , C )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here



mid_matrix=pinv([C ; B] * [transpose(C) transpose(B)]); 
[num_rows, num_columns]=size(C); 
actual_mid_matrix=mid_matrix(: , 1:num_rows);

%{
display([transpose(C) transpose(B)])
display(A); 
display(actual_mid_matrix); 
display(C); 
%}
projcetion_A_onto_C_along_B=A*[transpose(C) transpose(B)]*actual_mid_matrix*C; 





%[Q_trans, R] = qr(transpose([B ; C ; A])); 

%L=transpose(R); 
%Q=transpose(Q_trans); 

%display(Q); 
%display(L); 
%R=L*Q; 
%display(R); 













%{Decomp=[transpose(B), transpose(C), transpose(A)]; 
%[Q_trans, L_trans] = ql_decomposition_reference(Decomp); 
%Q=transpose(Q_trans); 
%L=transpose(L_trans); 

%display(L); 
%display(Q); 
%projcetion_A_onto_C_along_B=[]; 

end

