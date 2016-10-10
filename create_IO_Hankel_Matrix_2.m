function [Up, Up_plus, Uf, Uf_minus, Hankel] = create_IO_Hankel_Matrix_2(data, j,  t )

[num_rows, num_columns]=size(data); 
hankel_matrix=[]; 

%display(hankel_matrix); 

for i = 1:num_rows-j+1
    row=[]; 
    for r= 1:j
        row(:, r)=transpose(data(i+r-1, :));
    end
    %display(row); 
    hankel_matrix=[hankel_matrix; row] ; 
end


display(hankel_matrix); 


assert(1<0); 

[num_hankel_rows, num_hankel_columns]=size(hankel_matrix); 
num_hankel_rows=num_hankel_rows/num_columns; 


h=t; 




Hankel=hankel_matrix;




Up=hankel_matrix(1:t, :); 
Uf=hankel_matrix(t+1:(t+h), :) ; 
Up_plus=hankel_matrix(1:t+num_columns, :); 
Uf_minus=hankel_matrix(t+num_columns+1:(t+h), :);

%{

display(t); 
display(j); 
display(hankel_matrix) ;

display(Up); 
display(Uf); 
display(Up_plus); 
display(Uf_minus);
 
%}
    


    
end

