function obervability_matrix_states= N4SID_Obervability_Matrix( input_data, output_data , j , i ) 
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here






[Up, Up_plus, Uf, Uf_minus, input_Hankel] =create_IO_Hankel_Matrix_2(input_data, j , i); 
[Yp, Yp_plus, Yf, Yf_minus, output_Hankel]= create_IO_Hankel_Matrix_2(output_data, j , i);
Wp=[Up; Yp];
Wp_plus=[Up_plus; Yp_plus]; 


display(Yp_plus) ;

%display(input_data); 

%O_h_i=orthogonal_projection(Yf, [Wp ; Uf]); 
%[num_rows, num_columns]=size(Wp);
%display(O_h_i) ;
%O_h_i_new=O_h_i(:, 1:num_rows)*Wp; 

%Project onto input data 
O_h_i=oblique_projection(Yf,Yp, Uf, Up); 


obervability_matrix_states=O_h_i; 


end

