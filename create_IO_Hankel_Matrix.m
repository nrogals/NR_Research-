function [Up, Up_plus, Uf, Uf_minus] = create_IO_Hankel_Matrix(data, j)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[num_rows, num_columns]=size(data); 
hankel_matrix=[]; 
for i = 1:num_rows-2
    row=[]; 
    for t= 1:j
        row(:, t)=transpose(data(i+t-1, :));
    end
    display(row); 
    hankel_matrix=[hankel_matrix; row] ; 
end

[num_hankel_rows, num_hankel_columns]=size(hankel_matrix); 
num_hankel_rows=num_hankel_rows/num_columns; 
i=floor(num_hankel_rows/2)*num_columns;
display(i); 
h=i; 
display(hankel_matrix); 

Up=hankel_matrix(1:i, :); 
Uf=hankel_matrix(i+1:(i+h), :) ; 
Up_plus=hankel_matrix(1:i+num_columns, :); 
Uf_minus=hankel_matrix(i+num_columns+1:(i+h), :); 







