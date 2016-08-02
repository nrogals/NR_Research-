function [ Up Yp Yf Yf_hankel, Uf_hankel] = create_Hankel_SSARX( input_data, output_data , p, f )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

[num_rows, num_columns]=size(input_data); 


Up=[]; 
Yp=[];
Yf=[]; 

for i = 1 : num_rows
    index=i; 
    if (index-1>=p)
       
        Yf=[Yf transpose(output_data(index, :))]; 
        
    end
    index=i-1; 
    
    if index<num_rows-p
        column_vector_input=[];
        column_vector_output=[]; 
        for t = 1 : p
            t_index=t-1;
            column_vector_input=[column_vector_input ; transpose(input_data(index+t_index+1, :))]; 
            column_vector_output=[column_vector_output ; transpose(output_data(index+t_index+1, :))]; 
        end
        %display(column_vector_input);
        %display(column_vector_output);
        Up=[Up column_vector_input]; 
        Yp=[Yp column_vector_output]; 
    end
end






    
Yf_hankel=[]; 
Uf_hankel=[]; 

for i = 1 : num_rows-f
    index=i-1; 
    if index<p
        t=2; 
    else
        column_vector_input=[]; 
        column_vector_output=[]; 
        for t= 1: f+1
            t_index=t-1; 
            column_vector_input=[column_vector_input ; transpose(input_data(index+t_index+1, :))]; 
            column_vector_output=[column_vector_output ; transpose(output_data(index+t_index+1, :))];
        end
        
        Uf_hankel=[Uf_hankel column_vector_input]; 
        Yf_hankel=[Yf_hankel column_vector_output]; 
        
    end
end
        
                 
            
            

    
                
            
            
            
        
        
        
        
            
        





end

