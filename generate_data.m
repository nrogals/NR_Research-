function [input_data, output_data, input_coefficients, output_coefficients] = generate_data(m, n, iterates)

A=[m ; n];
num_initial_conditions = max(A); 
num_data_points = num_initial_conditions + iterates;

input_coefficients = 10*rand(1, m);
output_coefficients = 10*rand(1, n);


input_data= 10*rand(1, num_data_points);
output_data = zeros(1, num_data_points); 
for t= 1:num_data_points
    if (t<=num_initial_conditions)
        output_data(1,t)=rand(); 
        
        
    else 
        %Generate data using linear rule
        %display HIT
        total_sum = 0; 
        for i=1:m
            %last input coefficient is paired with time t-1
            total_sum = total_sum + input_coefficients(1, m-i+1) * input_data(1,t-i);
        end
        for i=1:n 
            total_sum = total_sum + output_coefficients(1, n-i+1) * output_data(1,t-i);
        end 
         output_data(1,t)=total_sum; 
    end 
          
       
    
end 