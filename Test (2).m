%Test script



coefficient_mode_matrix=[1 2 ; 3 4 ]; 
eigenvalues_without_congugate=[-2+3j , -1+ 0.5j ]; 
num_eigenvals=2; 
num_signals=2;
time_step=0.2; 
num_samples=10; 
guess_num_modes=2; 



%{
time=1;
display(coefficient_mode_matrix);
display(eigenvalues);
display(coefficient_mode_matrix);
[ new_vector ] = get_sample(coefficient_mode_matrix, eigenvalues_without_congugate, num_signals, num_eigenvals, time);
display(new_vector); 
%}

data=get_data( coefficient_mode_matrix, eigenvalues_without_congugate, num_signals, num_eigenvals, time_step, num_samples);
%display(A); 

 [recurrence_matrix] = generate_vector_reccurence_matrix(data, num_samples, guess_num_modes, num_signals);
 display(data);
 display(recurrence_matrix); 
 display(recurrence_matrix(1, 2 , 2)); %should be  8.2073
 display(recurrence_matrix(1, 1 , 1)); %should be  1.6396
 display(recurrence_matrix(2, 1 , 1)); %should be  0.9117





