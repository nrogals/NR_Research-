function [ vector_coefficient_matrix, eigenvalues ] = get_eigenvalues( vector_coefficients, num_signals, guess_num )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
coefficient_matricies=vector_coefficients; 

%display(coefficient_matricies) ; 

t_1=transpose(coefficient_matricies(1:num_signals ,  1: num_signals));
coefficient_matricies=coefficient_matricies(num_signals+1:end ,:); 
t_2=transpose(coefficient_matricies(1:num_signals ,  1: num_signals)); 

%display(coefficient_matricies);
display(t_1); 
display(t_2);
identity=eye(2); 

complex_roots=polyeig((-1*t_2), (-1*t_1 ),  identity); 

display(complex_roots); 

vector_coefficient_matrix=[];
eigenvalues=complex_roots;





