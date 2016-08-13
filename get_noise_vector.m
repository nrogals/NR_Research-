function [ output_vector ] = get_noise_vector(base_vector, noise_param, flag )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

output_vector=[]; 
[num_rows, num_columns]=size(base_vector); 
display(noise_param);
for i =1 : num_rows
    t=base_vector(i,1); 
    if strcmp(flag,'Normal')
        val=normrnd(0, noise_param(1,1)); 
    elseif strcmp(flag,'Normal_with_Outliers')
        noise_varance=noise_param(1); 
        probability_of_outlier=noise_param(2); 
        outlier_magnitude=noise_param(3); 
        
        t=normrnd(0, noise_varance); 
        if rand<probability_of_outlier
            val=outlier_magnitude*outlier_magnitude; 
        else
            val=t;
        end
        
        
       
    end
    output_vector=[output_vector; val]; 
end

            
        
    
    


