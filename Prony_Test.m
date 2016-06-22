%Test Prony


damp_vals=[-1.0 , -2.0, -3.0]; 
amplitude_vals =[0.5, 0.3, -0.2]; 
frequency_vals=[2 , 3 , 4]; 
phase_vals=[0.0, 0.0, 0.0]; 
noise_mean=0.0; 
noise_variance=1; 
time=0.5; 
number_sinusoids=3; 
t= get_sample( time, damp_vals, amplitude_vals, frequency_vals, phase_vals, number_sinusoids, noise_mean, noise_variance);
display(t);  


%{
samples=[1, 2, 3, 4, 5, 6, 7]; 
number_samples=7; 
model_number=3; 
matrix=generate_reccurence_matrix( samples, number_samples, model_number); 
display(matrix);
%}






