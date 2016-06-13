function [ output_args ] = extend(coefficients, greater_length, lesser_length)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

for i = 1:(greater_length-lesser_length)
    coefficients(1 , (i+lesser_length))=0; 
end

