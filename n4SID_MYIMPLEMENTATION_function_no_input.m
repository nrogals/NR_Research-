function [ eigenvalues , eigenvectors] = n4SID_MYIMPLEMENTATION_function_no_input( input_data, output_data , j, singular_value_epsilon)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here



[num_rows,num_columns]=size(input_data); 


new_i=floor(num_rows); 
[Up, Up_plus, Uf, Uf_minus, input_Hankel] = create_IO_Hankel_Matrix(input_data, j); 
[Yp, Yp_plus, Yf, Yf_minus, output_Hankel]= create_IO_Hankel_Matrix(output_data, j);
Wp=[Up; Yp];
Wp_plus=[Up_plus; Yp_plus]; 

%O_h_i=orthogonal_projection(Yf, [Wp ; Uf]); 
%[num_rows, num_columns]=size(Wp);
%display(O_h_i) ;
%O_h_i_new=O_h_i(:, 1:num_rows)*Wp; 

%Project onto input data 
O_h_i=oblique_projection(Yf, Yp, Uf, Up); 
O_h_i_plus_one=oblique_projection(Yf_minus, Yp_plus, Uf_minus, Up_plus);
%display(O_h_i); 
[num_rows_O_h_i, num_columns_ohi]=size(O_h_i); 
%Get T and T_bar
W1=eye(num_rows_O_h_i); 
W2=eye(num_columns_ohi); 
[U,S,V] = svd(W1*O_h_i*W2); 
[num_rows, num_columns]=size(S); 


order=0; 
for i= 1: min(num_rows, num_columns)
    if (S(i,i)>singular_value_epsilon)
        order=order+1; 
    end
end

U_trunc=U(:, 1:order); 
S_trunc=S(1:order, 1:order); 


tau_h= U_trunc*S_trunc.^0.5; 

[t, num_rows_1]=size(output_data); 
C=tau_h(1:t, :); 
tau_bar_h=tau_h(num_rows_1+1:end, :);
w=tau_h(1:end-num_rows_1, :); 
A_mat=w\tau_bar_h;
[V, D]=eig(A_mat); 

[eigenvectors, eigenvalues]=convert_eigenvectors_to_modeshapes(C, V, diag(D)); 


end

