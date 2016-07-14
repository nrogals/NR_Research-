iterates=10;
input_vec_length=2;
A=-0.1*[2 -1 0 ; -1 2 -1 ; 0 -1 2]; 

B=[1 2; -3  4; 5 6]; 
C=[5 -6 7 ; 8 -9 10 ; 2 4 6; -8 9 2]; 
D=[0 0; 0 0; 0 0; 0 0]; 
x0=[0; 0 ; 1];

[num_rows_of_C, num_columns_of_C]=size(C); 

%Get Linear Data
[input_data, output_data, states ] = Linear_System_Data_Gen(A, B, C, D, x0, iterates, input_vec_length, 0); 
[num_rows,num_columns]=size(input_data); 


new_i=floor(num_rows); 
j=3; 
[Up, Up_plus, Uf, Uf_minus, input_Hankel] = create_IO_Hankel_Matrix(input_data, j); 
[Yp, Yp_plus, Yf, Yf_minus, output_Hankel]= create_IO_Hankel_Matrix(output_data, j);
Wp=[Up; Yp];
Wp_plus=[Up_plus; Yp_plus]; 

%O_h_i=orthogonal_projection(Yf, [Wp ; Uf]); 
%[num_rows, num_columns]=size(Wp);
%display(O_h_i) ;
%O_h_i_new=O_h_i(:, 1:num_rows)*Wp; 

%Project onto input data 
O_h_i=oblique_projection(Yf, Uf, Wp); 
O_h_i_plus_one=oblique_projection(Yf_minus, Uf_minus, Wp_plus);
display(O_h_i); 
[num_rows_O_h_i, num_columns_ohi]=size(O_h_i); 
%Get T and T_bar
W1=eye(num_rows_O_h_i); 
W2=eye(num_columns_ohi); 
[U,S,V] = svd(W1*O_h_i*W2); 
[num_rows, num_columns]=size(S); 
%{
singular_value_epsilon=0; 
order=0; 
for i= 1: min(num_rows, num_columns)
    if (S(i,i)>singular_value_epsilon)
        order=order+1; 
    end
end
%}
tau_h= U*(S.^0.5); 

[t, num_rows_1]=size(output_data); 
tau_bar_h=tau_h(num_rows_1+1:end, :);
w=tau_h(1:end-num_rows_1, :); 
A=w\tau_bar_h;
display(eig(A));

