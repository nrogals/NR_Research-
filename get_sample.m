function [ sampled_val, noisy_sample ] = get_sample( time, damp_vals, amplitude_vals, frequency_vals, phase_vals, number_sinusoids, noise_mean, noise_variance)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


sum=0; 
for i=1:number_sinusoids
    sum = sum + amplitude_vals(i)*(exp(damp_vals(i)*time)* cos(2*pi*frequency_vals(i)*time+ phase_vals(i))); 
end
display(sum);
noisy_sample=get_noisy_val(sum, noise_variance);
sampled_val=sum; 