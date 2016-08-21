%The script calculates modes for the 6 contingencies on the 9 bus
%system. Simulating realtime data, the script adds noise to each of the 6 
%contingencies and then extracts the modes. For each noisy contingency it 
%finds the contingency that has the closest mode shapes by finding the
%contigency that has the minimum minimum mode matching. The mode extraction
%algorithm is N4SID

num_contigs=6; 
order = 6; 
begin_string='9busContig'; 
end_string='.mat'; 
p=10; 
f=6;

contingency_modes_no_noise=cell(2,num_contigs); 
for i = 1 : num_contigs
    
    new_string=strcat(begin_string, int2str(i), end_string); 
    load (new_string); 
    data_2=data;
   
    output_data=transpose(data_2);
    [num_rows, num_columns]=size(output_data); 


    
    input_data=zeros(num_rows, 3); 
    p=10; 
    f=6; 
    minimum_singular_value=0.01; 
    display(input_data);
    display(output_data); 
    
     
    [eigenvalues, eigenvectors] = n4sid_default(output_data, order ); 
    %                             SSARX_MLR( input_data, output_data, p, f, minimum_singular_value, fixed_order)
    
    
    
    contingency_modes_no_noise(1, i)=mat2cell(eigenvalues, [1] , [order]); 
    [num_rows, num_columns]=size(eigenvectors); 
    contingency_modes_no_noise(2, i)=mat2cell(eigenvectors, [num_rows], [num_columns]);
end

%display(cell2mat(contingency_modes_no_noise(2,1))); 
%assert(1<0); 

noise_level=0.000000000001; 
num_noise_steps=20; 
noise_multiplier=10; 
noise_variances=[]; 

iterates=5; 


percent_correct_noise=[]; 
for i = 1 : num_noise_steps
    noise_level=noise_level*noise_multiplier; 
    noise_variances(i)=noise_level; 
    percentage_correct_array=[]; 
    for i = 1 : iterates
        
        contingency_modes=cell(2,num_contigs); 
        for i = 1 : num_contigs
    
            new_string=strcat(begin_string, int2str(i), end_string); 
            load (new_string);
            data_3=data; 
            [num_rows, num_columns]=size(data); 
            
            data_2=data_3 + normrnd(0, noise_level, num_rows, num_columns);

            output_data=transpose(data_2);
            [num_rows, num_columns]=size(output_data); 


            input_data=zeros(num_rows, 3); 
            p=10; 
            f=6; 
            minimum_singular_value=0.01; 
            display(input_data);
            display(output_data); 


            [eigenvalues, eigenvectors] = n4sid_default(output_data, order ); 
            %                             SSARX_MLR( input_data, output_data, p, f, minimum_singular_value, fixed_order)

            display(eigenvalues); 
            %assert(1<0); 

            contingency_modes(1, i)=mat2cell(eigenvalues, [1] , [order]); 
            [num_rows, num_columns]=size(eigenvectors); 
            contingency_modes(2, i)=mat2cell(eigenvectors, [num_rows], [num_columns]);
        end
        %comparision of modes to 
        
        error_minimizing_index=1;
        error=intmax; 
        count_correct=0; 
        for j=1 : num_contigs
            error_minimizing_index=1;
            error=1000;
            for i = 1 : num_contigs
                modeled_eigenvalues=transpose(cell2mat(contingency_modes(1,j))); 
                modeled_eigenvectors=cell2mat(contingency_modes(2,j)); 
                actaul_eigenvalues=transpose(cell2mat(contingency_modes_no_noise(1,i))); 
                actaul_eigenvectors=(cell2mat(contingency_modes_no_noise(2,i)));
                display(modeled_eigenvalues); 
                display(modeled_eigenvectors); 
                display(actaul_eigenvalues); 
                display(actaul_eigenvectors); 
                
                [ eig_error, eig_vec_error, x ] = calculate_error(modeled_eigenvalues, modeled_eigenvectors, actaul_eigenvalues, actaul_eigenvectors); 
                display(eig_vec_error); 
                
                if eig_vec_error < error 
                    error_minimizing_index=i; 
                    error=eig_vec_error; 
                end
                    
            end
            
            if error_minimizing_index==j
                count_correct=count_correct+1; 
            end
        end
        percentage_correct=count_correct/num_contigs; 
        percentage_correct_array=[percentage_correct_array; percentage_correct]; 
        
        
    end
    average_percentage_correct=mean(percentage_correct_array); 
    percent_correct_noise=[percent_correct_noise, average_percentage_correct]; 
end

display(percent_correct_noise); 
display(noise_variances);

        
    
    