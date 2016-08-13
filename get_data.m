function [samples, time_samples] = get_data( coefficient_mode_matrix, eigenvalues, num_signals, num_eigenvals, time_step, number_samples, noise_parameters, flag) 
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%coefficient_mode_matrix gives a matrix where the ith column is the mode shape
%for the ith eigenvalue 
%
%num_signals gives the number of rows
%num_eigenvals is same as number of modes gives the number of columns

%Flag is a string representing a distribution that can be used as the noise
%model 

samples=[]; 
time_samples=[]; 
for i=1:number_samples
    time=i*time_step; 
    new_sample=get_sample_vector(coefficient_mode_matrix, eigenvalues, num_signals, num_eigenvals, time, noise_parameters, flag);
    samples=[samples , new_sample]; 
    time_samples(i)=time;
end 


    
    

