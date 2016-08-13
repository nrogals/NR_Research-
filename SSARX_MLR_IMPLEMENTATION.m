
A=-0.1*[2 -1 0 ; -1 2 -1 ; 0 -1 2];
% -0.3414
%-0.2000
%-0.0586
B=[1 2; -3  4; 5 6]; 
C=[5 -6 7 ; 8 -9 10 ; 2 4 6; -8 9 2]; 
D=[0 0; 0 0; 0 0; 0 0]; 
%num_rows K is 3, num_columns = #rows of C ==4

K=[3 -0.5 6 8; 2 3 -4 8; 9.2 8.5 6 19]; 


x0=[0; 0 ; 100];

[num_rows_of_C, num_columns_of_C]=size(C); 

input_modifier=1; 
observation_variance=0.01; 
%state_noise_variance is useless
state_noise_variance=0.0000000000; 
minimum_singular_value=0.1; 
iterates=100; 
input_vec_length=2;
model_indicator=1; 
[input_data, output_data, states ] = Linear_System_Data_Gen(A, B, C, D, K, x0, iterates, input_vec_length, 1, input_modifier, observation_variance, state_noise_variance, model_indicator); 


p=4; 
f=3; 
[eigenvalues, eigenvectors]=SSARX_MLR(input_data, output_data, p , f , minimum_singular_value); 
display(eigenvalues); 
display(eigenvectors);








