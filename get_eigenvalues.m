function [ vector_coefficient_matrix, eigenvalues ] = get_eigenvalues( vector_coefficients, num_signals, guess_num )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
coefficient_matricies=[]; 
for i = 1 : guess_num
    coefficients=vector_coefficients((i-1)*num_signals^2+1 : i*num_signals^2); 
    %display(coefficients);
    matrix=reshape_horizontally(coefficients , num_signals); 
    %display(matrix)
    coefficient_matricies=[matrix, coefficient_matricies]; 
end

%display(coefficient_matricies) ; 

t_1=coefficient_matricies(1:num_signals ,  1: num_signals);
coefficient_matricies=coefficient_matricies(: , num_signals+1:end); 
t_2=coefficient_matricies(1:num_signals ,  1: num_signals); 
%display(t_1); 
%display(t_2); 
coefficient_matricies=coefficient_matricies(num_signals:end , num_signals :end); 

complex_roots=polyeig(t_2, t_1); 

display(complex_roots); 

vector_coefficient_matrix=[];
eigenvalues=[]; 





