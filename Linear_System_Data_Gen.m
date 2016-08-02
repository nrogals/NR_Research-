function [input_data, output_data, states ] = Linear_System_Data_Gen(A, B, C, D, K, x0, iterates, input_vec_length, indicator, input_modifier, observation_variance_param, state_variance_param, model_indicator)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

state=x0; 
input_data=[]; 
output_data=[]; 
states=x0; 
[x, state_vec_length]=size(A); 

for i=1:iterates
    if (indicator==1)
        input=randn(input_vec_length , 1)*input_modifier;
    else
        input=zeros(input_vec_length, 1); 
    end
   
   
    observed_state=C*state+D*input; 
    [num_rows, num_columns]=size(observed_state);
    observed_state_noise=[]; 
    for i = 1 : num_rows
        t=observation_variance_param; 
        %t=1;
        noise=normrnd(0, t); 
        observed_state_noise=[observed_state_noise; noise]; 
    end
    
    actual_observed_state=observed_state+observed_state_noise;     
    
    
    state=A*state+B*input;
    
    state_noise=[]; 
    
    display(observed_state_noise);
    
    for r = 1 : state_vec_length
        s=state_variance_param;
        %s=1;
        if model_indicator==1
            state_noise=K*observed_state_noise; 
        else
            state_noise(r,1)=normrnd(0, s);  
        end
        
    end
    
    
    actual_next_state=state+state_noise; 
    %display(state); 
    %display(state_noise);
    %display(actual_next_state); 
    
    states=[states; actual_next_state ]; 
    state=actual_next_state; 
    input_data=[input_data; transpose(input)]; 
    output_data=[output_data; transpose(actual_observed_state)];  
end
