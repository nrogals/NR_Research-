iterates=10;
input_vec_length=2;
A=-0.1*[2 -1 0 ; -1 2 -1 ; 0 -1 2]; 

B=[1 2; -3  4; 5 6]; 
C=[5 -6 7 ; 8 -9 10 ; 2 4 6; -8 9 2]; 
D=[0 0; 0 0; 0 0; 0 0]; 
x0=[0; 0 ; 0];

[num_rows_of_C, num_columns_of_C]=size(C); 

%Get Linear Data
[input_data, output_data, states ] = Linear_System_Data_Gen(A, B, C, D, x0, iterates, input_vec_length); 
[num_rows,num_columns]=size(input_data); 


new_i=floor(num_rows); 
j=3; 
[Up, Up_plus, Uf, Uf_minus, input_Hankel] = create_IO_Hankel_Matrix(input_data, j); 
[Yp, Yp_plus, Yf, Yf_minus, output_Hankel]= create_IO_Hankel_Matrix(output_data, j);
Wp=[Up; Yp];
Wp_plus=[Up_plus; Yp_plus]; 

O_h_i=orthogonal_projection(Yf, [Wp ; Uf]); 
display(O_h_i);


[num_rows, num_columns]=size(Wp);