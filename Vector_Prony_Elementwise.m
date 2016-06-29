
coefficient_mode_matrix=[1 3 ; 
                         2 4 ]; 
eigenvalues_without_congugate=[-0.9+8j -0.2+ 0.5j]; 
num_eigenvals=2; 
num_signals=2;
time_step=1; 
num_samples=15; 
guess_num_modes=4; 

[data,time_samples]=get_data( coefficient_mode_matrix, eigenvalues_without_congugate, num_signals, num_eigenvals, time_step, num_samples);
display(data); 

t=size(data); 
length=t(2); 
time_step=1; 



for i = 1 : num_signals
    samples=data(i , :); 
    plot(time_samples, samples);
    guessed_number_sinusoids=guess_num_modes; 
    [model_damp_vals, model_amplitude_vals, model_frequency_vals ]= one_d_prony( samples, guessed_number_sinusoids, time_step );
    display(model_damp_vals); 
end