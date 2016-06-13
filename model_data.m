function [coefficients, norm_error] = model_data(m, n, input_data, output_data)
A=[m ; n];
num_initial_conditions = max(A); 
coefficients=zeros(m+n); 

data_size=size(input_data);
num_data_entries= data_size(2); 
A=[]; 
y_t_accum=[]; 



for t=1:num_data_entries 
    
    if (t <= num_initial_conditions)
        %do nothing 
        w=2; 
    else
        
        row_vector=zeros(1, m+n); 
        for i=1:m 
            row_vector(i)=input_data(t-i); 
            
        end
        for i=1:n
            row_vector(m+i)=output_data(t-i); 
        end
        A = cat(1, A, row_vector);
        y_t= output_data(1,t); 
        y_t_accum=[y_t_accum; y_t]; 
        
       
        
        
    end 
    
end 

%display(size(y_t_accum)); 
%display(A); 
x=A\y_t_accum ; 
norm_error=norm(A*x-y_t_accum); 
coefficients=x; 