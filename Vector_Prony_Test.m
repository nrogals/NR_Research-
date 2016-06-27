%Test script



coefficient_mode_matrix=[1 3 ; 
                         2 4 ]; 
eigenvalues_without_congugate=[-0.6+8j -0.2+ 0.5j]; 
num_eigenvals=2; 
num_signals=2;
time_step=1; 
num_samples=15; 
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
%display(A)
num_signals=2; 
[coefficient_mode_matrix, eigenvalues, reccurence_matrix, reccurence_vector] = vector_prony(data , num_samples, guess_num_modes, num_signals); 

%t1=coefficient_mode_matrix(1); 
%t2=coefficient_mode_matrix(2); 
 
 %display(data);
 %display(recurrence_matrix); 
 %display(reccurence_vector); 
 %display(recurrence_matrix(1, 2 , 2)); %should be  8.2073
 %display(recurrence_matrix(1, 1 , 1)); %should be  1.6396
 %display(recurrence_matrix(2, 1 , 1)); %should be  0.9117
 %display(recurrence_matrix(1, 1 , 2)); %should be  4.9
 %display(recurrence_matrix(2, 1 , 1));
 
 %display(recurrence_matrix); 
 %w=recurrence_matrix(1,1,2)
 
 
 
 
 





