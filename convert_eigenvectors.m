function [ converted_eigenvectors, converted_eigenvalues ] = convert_eigenvectors_to_modeshapes( C_mat, V_column_eigenvectors, eigenvalues )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

[num_rows, num_columns]=size(V_column_eigenvectors); 


converted_eigenvectors=[]; 
for i =1:num_columns
    converted_eigenvectors=[converted_eigenvectors (C_mat*V_column_eigenvectors(:, i))];   
end

[num_rows, num_columns]=size(eigenvalues); 

new_eigenvalues=[]; 
for i = 1:num_rows
    new_eigenvalues=[new_eigenvalues log(eigenvalues(i))]; 
end

converted_eigenvalues=new_eigenvalues; 



