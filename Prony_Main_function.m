function [model_damp_vals, model_amplitude_vals, model_frequency_vals] = Prony_Main_function( number_sinusoids, guessed_number_sinusoids_1,  damp_vals, amplitude_vals, frequency_vals, noise_variance, N, time_step) 

%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here



%{
number_sinusoids= 3 ;
damp_vals=[-0.01, -0.3, -10]; 
amplitude_vals =[0.1, 0.5, 5]; 
frequency_vals=[4, 4.1, 0.9 ]; 
phase_vals=[0.0 , 0.0, 0.0]; 
noise_mean=0.0; 
noise_variance=0.00001; 

guessed_number_sinusoids_1=3; 

N=100; 
time_step=0.1;
%}

phase_vals=zeros(2*number_sinusoids); 
noise_mean=0.0; 

guessed_number_sinusoids=guessed_number_sinusoids_1*2; 

N=100; 
time_step=0.1;
samples=[];
time_points=zeros(N); 
noisy_samples=[];
for i =1:N
    [new_sample, noisy_new_sample]=get_sample(time_step*i , damp_vals, amplitude_vals, frequency_vals, phase_vals, number_sinusoids, noise_mean, noise_variance);
    noisy_samples(i)=noisy_new_sample;
    samples(i)=new_sample; 
    time_points(i)=i*time_step; 
end
 
[model_damp_vals, model_amplitude_vals, model_frequency_vals] = one_d_prony(noisy_samples, guessed_number_sinusoids, time_step); 

end

