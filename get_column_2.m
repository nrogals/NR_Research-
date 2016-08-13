function [ column_vector ] = get_column_2( w , num_signals )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

column_vector=[]; 
for i = 1 : num_signals
    column_vector=[column_vector; w(i)]; 
end



end

