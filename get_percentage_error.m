function [ average_percent_error ] = get_percentage_error( actual_eigenvector, modeled_matched_eigenvector )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[num_rows, num_columns]=size(actual_eigenvector); 

sum_error=0; 
for i = 1 : num_rows-1
    sum_error=sum_error+abs((actual_eigenvector(i+1)-modeled_matched_eigenvector(i+1))/actual_eigenvector(i+1)); 
end

average_percent_error=sum_error/(num_rows-1); 
