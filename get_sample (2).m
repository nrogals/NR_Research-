function [ new_vector ] = get_sample_vector(coefficient_mode_matrix, eigenvalues, num_signals, num_eigenvals, time);
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

sum=zeros(num_signals, 1); 
t=size(coefficient_mode_matrix); 
num_columns=t(2); 

assert (num_columns==num_eigenvals); 

for i=1:num_eigenvals
    sum=sum+ (exp(eigenvalues(i)*time) + exp(conj(eigenvalues(i))*time)) * coefficient_mode_matrix(:,1); 
end
new_vector=sum; 





