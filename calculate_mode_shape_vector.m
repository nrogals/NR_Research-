function [ mode_shape_vector ] = calculate_mode_shape_vector(eigenvector)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

vector=[]; 
[num_rows, num_columns]=size(eigenvector); 
for i = 1 : num_rows
    vector=[vector ; (eigenvector(i)/eigenvector(1))]; 
end
mode_shape_vector=vector; 
%This will look like something for the eigenvector [3;4], [1, 1.33] 