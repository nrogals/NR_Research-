%The script loads contingency data for 9 bus 6 contingency system. It then
%adds noise to the data at noise_variances(i). It selects the contingency
%that minimizes the norm between contingency data and noisy data. 

noise_level=0.000000000000000001; 
num_noise_steps=20; 
noise_multiplier=10; 
noise_variances=[]; 

iterates=10; 
num_contigs=6;
begin_string='9busContig'; 
end_string='.mat'; 

percent_correct_noise=[]; 
for r = 1 : num_noise_steps
    noise_level=noise_level*noise_multiplier; 
    noise_variances(r)=noise_level; 
    percentage_correct_array=[]; 
    for t = 1 : iterates
        correct_count=0; 
        for i = 1 : num_contigs
    
            new_string=strcat(begin_string, int2str(i), end_string); 
            load (new_string);
            data_3=data; 
            [num_rows, num_columns]=size(data); 
            
            
            data_2=data_3 + normrnd(0, noise_level, num_rows, num_columns);
            
            error=intmax; 
            minimizing_index=-1; 
            for j = 1 : num_contigs
                new_string=strcat(begin_string, int2str(j), end_string); 
                load (new_string);
                data_1=data;
                error_calc=norm(data_1-data_2);
                if error_calc<error
                    minimizing_index=j;
                    error=error_calc;
                end
            end
            if i==minimizing_index
                correct_count=correct_count+1; 
            end
        end
        
        percentage=correct_count/num_contigs; 
        %comparision of modes to 
        
        percentage_correct_array=[percentage_correct_array percentage]; 
    end
    average_percentage_correct=mean(percentage_correct_array); 
    percent_correct_noise=[percent_correct_noise, average_percentage_correct]; 
end

display(percent_correct_noise); 
display(noise_variances); 

