function [ model_damp_vals, model_amplitude_vals, model_frequency_vals ]= one_d_prony( samples, guessed_number_sinusoids, time_step )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

Least_Squares=[]; 
t=size(samples); 
number_samples=t(2);
%display(samples);
non_dominant=0.00; 


reccurence_matrix=generate_reccurence_matrix( samples, number_samples, guessed_number_sinusoids)
r=number_samples-guessed_number_sinusoids
b=transpose(samples(1, number_samples-r+1:number_samples));
%display(b); 

x=reccurence_matrix\b; 
char_poly_roots=get_eigenvals((transpose(x))); 
%display(char_poly_roots); 
%display(x); 
accum=[]; 
for i=1:guessed_number_sinusoids
    accum(i)=log(char_poly_roots(i))*(1/time_step); 
end
%display(accum)
complex_matrix=[]; 

for i=1:(number_samples-guessed_number_sinusoids) 
    row_vector=(transpose(char_poly_roots)).^(guessed_number_sinusoids+i); 
    complex_matrix=[complex_matrix ; row_vector]; 
end
%display(complex_matrix); 


c=complex_matrix\b; 

%display(c); 
w=transpose(accum); 
%display(w); 
index=1; 
for i=1:guessed_number_sinusoids
    if mod(i , 2)==1
        model_damp_vals(index)=real(w(i));
        model_frequency_vals(index)=imag(w(i))/(2*pi); 
        model_amplitude_vals(index)=2*real(c(i)); 
        index=index+1; 
        else 
            %Nothing
        end
        
    
end
            


