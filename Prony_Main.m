
%{
damp_vals=[-0.2 , -0.1, -0.4]; 
amplitude_vals =[0.5, 0.3, -0.2]; 
frequency_vals=[2 , 3 , 4]; 
phase_vals=[0.2, 0.8, 0.3]; 
noise_mean=0.0; 
noise_variance=0.0; 
%}

number_sinusoids= 3 ;
damp_vals=[-0.01, -0.3, -10]; 
amplitude_vals =[0.1, 0.5, 5]; 
frequency_vals=[4, 4.1, 0.9 ]; 
phase_vals=[0.0 , 0.0, 0.0]; 
noise_mean=0.0; 
noise_variance=0.00001; 
N=100; 
time_step=0.1;

guessed_number_sinusoids_1=3; 
guessed_number_sinusoids=guessed_number_sinusoids_1*2; 


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
display(model_damp_vals); 
display(model_amplitude_vals); 
display (model_frequency_vals); 

%{
for w=1:guessed_number_sinusoids_1
    y_points=[];
    for i=1:N
        time=time_points(i); 
        y_point=model_amplitude_vals(w)*(exp(model_damp_vals(w)*time)* cos(2*pi*model_frequency_vals(w)*time));
        y_points(i)=y_point; 
        
    end
    plot(time_points, y_points); hold on; 
    
end 
plot(time_points, samples );  hold on;
plot(time_points, noisy_samples);

%}

        

%display(norm(frequency_vals-model_frequency_vals))


