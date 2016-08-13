function  [eigenvalues] = get_eigenvalues( vector_coefficients, num_signals, guess_num )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
coefficient_matricies=vector_coefficients; 

%display(coefficient_matricies) ; 

complex_roots = hard_coded_poly_eig(coefficient_matricies, guess_num , num_signals); 
eigenvalues=complex_roots;