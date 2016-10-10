function obervability_matrix = form_observability_matrix( C , A , f )
%The function forms the observability matrix

[num_rows, num_columns]=size(C); 

number_columns=num_columns; 
number_rows=f * num_rows ; 

accum_matrix = zeros(number_rows, number_columns) ; 

initial_matrix = C; 
for  i = 1 : f
     
    
    first_row_index = (num_rows * (i-1) + 1) ; 
    second_row_index= (num_rows*i);
    accum_matrix (first_row_index : second_row_index , :) = initial_matrix;
    initial_matrix = initial_matrix * A; 
    
end 

obervability_matrix=accum_matrix;





    
    
end





