%This the main level script for my implementation of 4SID Algorithms

iterates=10;
input_vec_length=2;
A=-0.1*[2 -1 0 ; -1 2 -1 ; 0 -1 2]; 

B=[1 2; -3  4; 5 6]; 
C=[5 -6 7 ; 8 -9 10 ; 2 4 6; -8 9 2]; 
D=[0 0; 0 0; 0 0; 0 0]; 
x0=[0; 0 ; 0];



[input_data, output_data, states ] = Linear_System_Data_Gen(A, B, C, D, x0, iterates, input_vec_length); 

j=3; 
[Up, Up_plus, Uf, Uf_minus] = create_IO_Hankel_Matrix(input_data, j);
display(output_data); 
[Yp, Yp_plus, Yf, Yf_minus]= create_IO_Hankel_Matrix(output_data, j);











