%This the main level script for my implementation of 4SID Algorithms

iterates=50;
input_vec_length=2;
A=-0.1*[2 -1 0 ; -1 2 -1 ; 0 -1 2]; 

B=[1 2; -3  4; 5 6]; 
C=[5 -6 7 ; 8 -9 10 ; 2 4 6; -8 9 2]; 
D=[0 1; 0 0; 0 0; 1 0]; 
x0=[0; 0 ; 1];

[num_rows_of_C, num_columns_of_C]=size(C); 

%Get Linear Data
input_noise_variance=0; 
input_modifier=1; 

is_there_input=1; 
%No input 
%(A, B, C, D, K, x0, iterates, input_vec_length, indicator, input_modifier, observation_variance_param, state_variance_param, model_indicator)
[input_data, output_data, states ] = Linear_System_Data_Gen(A, B, C, D, [],  x0,  iterates, input_vec_length, is_there_input, input_modifier, 0, 0 , 0); 


%display(input_data); 
%assert(1<0); 




%function [input_data, output_data, states ] = Linear_System_Data_Gen(A, B, C, D, K, x0, iterates, input_vec_length, indicator, input_modifier, observation_variance_param, state_variance_param, model_indicator)

[num_rows,num_columns]=size(input_data); 


%Select j so Hankel is square

j=35; 


[Up, Up_plus, Uf, Uf_minus, input_Hankel] = create_IO_Hankel_Matrix(input_data, j); 
[Yp, Yp_plus, Yf, Yf_minus, output_Hankel]= create_IO_Hankel_Matrix(output_data, j);
Wp=[Up; Yp];
Wp_plus=[Up_plus; Yp_plus]; 

%display(input_data); 









%O_h_i=orthogonal_projection(Yf, [Wp ; Uf]); 
%[num_rows, num_columns]=size(Wp);
%display(O_h_i) ;
%O_h_i_new=O_h_i(:, 1:num_rows)*Wp; 

%Project onto input data 
O_h_i=oblique_projection(Yf,Yp, Uf, Up); 
O_h_i_plus_one=oblique_projection(Yf_minus, Yp_plus, Uf_minus, Up_plus);
display(O_h_i); 


[num_rows_O_h_i, num_columns_ohi]=size(O_h_i); 


%Get T and T_bar
W1=eye(num_rows_O_h_i); 
W2=eye(num_columns_ohi); 

[U,S,V] = svd(W1*O_h_i*W2); 
%display(S); 
[num_rows, num_columns]=size(S); 


singular_value_epsilon=0.1; 
order=0; 
for i= 1: min(num_rows, num_columns)
    if (S(i,i)>singular_value_epsilon)
        order=order+1; 
    end
end


[num_rows, num_columns]=size(S); 
S_trunc=S(1:order, 1:order); 
U_trunc=U(: , 1:order); 
%display(S_trunc); 
%display(U_trunc); 


tau_h= U_trunc*S_trunc.^0.5; 


display(tau_h); 



%tau_h= inv(W1)*U(:, 1:order)*(S(1:order, 1:order))^0.5; 
%Messd up above ^^^^
[t, num_rows_1]=size(output_data); 
%[num_rows, num_columns]=size(O_h_i_plus_one); 
tau_bar_h=tau_h(num_rows_1+1:end, :);
%display(tau_bar_h); 
w=tau_h(1:end-num_rows_1, :); 
%display(w);
%display(A)
A_mat=w\tau_bar_h;

display(eig(A_mat));
%display(A_mat); 
display(eig(A)); 



%Get the states
Xi=pinv(tau_h)*O_h_i; 
Xi_plus_one=pinv(tau_bar_h)*O_h_i_plus_one; 



%Form Ui and Yi
[num_rows_Xi, num_columns_Xi]=size(Xi); 
Ui_non_trunc=transpose(input_data); 
Ui=Ui_non_trunc(:, 1:j); 
Yi_non_trunc=transpose(output_data); 
Yi=Yi_non_trunc(: , 1:j); 

%Get system_matricies via Least Squares
system_matricies=transpose([Xi ; Ui]) \ transpose([Xi_plus_one ; Yi]); 
system_matricies=transpose(system_matricies);


A_matrix=system_matricies(1:num_rows_Xi, 1:num_rows_Xi); 
C_matrix=system_matricies(num_rows_Xi+1 : end, 1:num_rows_Xi); 
B_matrix=system_matricies(1:num_rows_Xi, num_rows_Xi +1 : end); 
D_matrix=system_matricies(num_rows_Xi+1:end, num_rows_Xi +1 : end); 




    


















