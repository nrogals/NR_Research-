function [ recurrence_matrix ] = generate_reccurence_matrix( samples, number_samples, guessed_number_sinusoids)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

recurrence_matrix=[];
for i=1:(number_samples-guessed_number_sinusoids)
    %display(recurrence_matrix); 
    row_vector=[];
    for t=1:guessed_number_sinusoids
        %display "Number"
        %display(guessed_number_sinusoids+i-t); 
        row_vector(t)=samples(guessed_number_sinusoids+i-t);  
    end
    w=size(recurrence_matrix); 
    num_rows=w(1); 
    %display(num_rows); 
    %display(row_vector);
    if num_rows < 1 
        recurrence_matrix=row_vector; 
        %display (recurrence_matrix)
        display Hitting
    else
        
        %display(recurrence_matrix); 
        recurrence_matrix=[recurrence_matrix; row_vector];
    
    end
    
     
end

end