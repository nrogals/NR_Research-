%Prony Tests
val=5; 
noise_step=0.1; 
noise_vals=[]; 
damp_vals_error_rec=[]; 
amplitude_vals_error_rec=[]; 
frequency_vals_error_rec=[]; 
num_points=100; 

for i = 1 : num_points 
noise_variance=noise_step*i

epsilon_damp_vals=5; 
epsilon_amplitude=5; 
epsilon_frequency=5; 




number_sinusoids= 3 ;
damp_vals=[-0.01, -0.3, -10]; 
amplitude_vals =[5, 0.5, 0.1]; 
frequency_vals=[4.1, 2, 0.9 ]; 
noise_mean=0.0; 
N=100; 
time_step=0.1;
guessed_number_sinusoids=3; 

[model_damp_vals, model_amplitude_vals, model_frequency_vals] = Prony_Main_function( number_sinusoids, guessed_number_sinusoids, damp_vals, amplitude_vals, frequency_vals, noise_variance, N, time_step); 

sorted_model_damp_vals=sort(model_damp_vals, 'descend'); 
sorted_model_amplitude_vals=sort(model_amplitude_vals, 'descend'); 
sorted_model_frequency_vals=sort(model_frequency_vals, 'descend'); 


display(sorted_model_damp_vals); 
display(sorted_model_amplitude_vals); 
display(sorted_model_frequency_vals); 

damp_vals_error=(norm(sorted_model_damp_vals-damp_vals)); 
amplitude_vals_error=(norm(sorted_model_amplitude_vals-amplitude_vals)); 
frequency_vals_error=(norm(sorted_model_frequency_vals-frequency_vals));
display(frequency_vals_error); 

%{
assert (damp_vals_error<epsilon_damp_vals) ; 
assert (amplitude_vals_error<epsilon_amplitude) ; 
assert (frequency_vals_error<epsilon_frequency); 
%}
noise_vals(i)=noise_variance; 
damp_vals_error(i)=damp_vals_error; 
amplitude_vals_error_rec(i)=amplitude_vals_error; 
frequency_vals_error_rec(i)= frequency_vals_error; 
end 
%display(noise_vals); 
%display(frequency_vals_error_rec); 
plot(noise_vals, frequency_vals_error_rec); 