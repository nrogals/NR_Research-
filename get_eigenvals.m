function [ r ] = get_eigenvals(output_coefficients)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    poly_input_coeff=-1*output_coefficients; 
    poly_coeff=[1, poly_input_coeff]; 
    %display(poly_coeff); 
    r=roots(poly_coeff); 
   
