function [Up, Yp, Uf, Uf_minus] = create_IO_Hankel_Matrix( data, j)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[num_rows, num_columns]=size(input_data); 
hankel_matrix=[]; 
for i = 1:num_rows-1
    row=[]; 
    for t= 1:j
        row(t)=transpose(data(i+t-1));
    end
    hankel_matrix=[hankel_matrix; row] ; 
end



