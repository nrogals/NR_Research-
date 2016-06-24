%This is the main script for vector prony with mode shape estimation 

coefficient_mode_matrix=[1 2 ; 3 4 ]; 
eigenvalues_without_congugate=[-2+3j , -4+0.5j ]; 
num_eigenvals=2; 
num_signals=2;
time_step=0.1; 
num_samples=10; 


[data, time_samples]=get_data(coefficient_mode_matrix,eigenvalues_without_congugate,num_signals, num_eigenvals, time_step, num_samples); 
%display(data); 
%sig_one=data(1, :); 
%plot(time_samples, sig_one); 






