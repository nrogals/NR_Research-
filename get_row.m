function [ row_vector ] = get_row( w , num_signals )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

row_vector=[]; 
for i = 1 : num_signals
    row_vector=[row_vector w(i)]; 
end

