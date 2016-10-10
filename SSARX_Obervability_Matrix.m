function obervability_matrix_states = SSARX_Obervability_Matrix( input_data, output_data, p, f, minimum_singular_value, fixed_order )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[Up Yp Yf Yf_hankel, Uf_hankel]=create_Hankel_SSARX( input_data, output_data , p, f ); 
Wp=[Up ; Yp]; 


%assert(1<0);


[num_rows, num_columns_input] = size(input_data); 
[num_rows, num_columns_output]=size(output_data);



O_matrix=Yf*transpose(Wp)*pinv(Wp*transpose(Wp)); 

E_f= Yf - O_matrix* Wp; 

%display(O_matrix); 
%phi_matrix=get_phi_beta_matricies(O_matrix, 0, 2, num_columns_output, num_columns_input, p); 


%{
e_matrix=[]; 

for i = 1:num_rows
    k=i;
    if k<=p
        t=2; 
    else
        %k>=p
        sum=zeros(num_columns_output , 1); 
        for t = 1 : p
            addition=get_phi_beta_matricies(O_matrix, 0 , t-1, num_columns_output, num_columns_input, p) * transpose(input_data(k-t, :)); 
            display(addition); 
            sum= sum + addition; 
        end
        
        for t=1:p
            addition=get_phi_beta_matricies(O_matrix, 1 , t-1, num_columns_output, num_columns_input, p) * transpose(output_data(k-t, :));
            display(addition); 
            sum= sum + addition; 
        end
        
        ek_vector=output_data(k)-sum; 
        e_matrix=[e_matrix, ek_vector]; 
    end
end

%}

%get_phi_beta_matricies(block_matrix, indicator , index, num_phi_rows, num_beta_rows, p)
[ matrix ] = get_phi_beta_matricies(O_matrix, 1 , 0, num_columns_output , num_columns_input, p) ; 

phi_matrix=[]; 

for i = 1 : f+1
    column_matrix=[]; 
    for t = 1:f+1
        if t==i
            column_matrix=[column_matrix ; eye(num_columns_output)]; 
            
        elseif (t<i)
             column_matrix=[column_matrix ; zeros(num_columns_output)]; 
             
        else
            %display(O_matrix); 
            add_matrix=-1*get_phi_beta_matricies(O_matrix, 1 , t-i-1, num_columns_output, num_columns_input, p); 
            %display(add_matrix); 
            
            column_matrix=[column_matrix; add_matrix ]; 
        end
    end
    %display(column_matrix); 
    phi_matrix=[phi_matrix column_matrix]; 
end






beta_matrix=[]; 

for i = 1 : f+1
    column_matrix=[]; 
    for t = 1:f+1
        if t==i
            column_matrix=[column_matrix; zeros(num_columns_output, num_columns_input )]; 
            
        elseif (t<i)
            column_matrix=[column_matrix ; zeros(num_columns_output, num_columns_input)]; 
             
        else
            column_matrix=[column_matrix; get_phi_beta_matricies(O_matrix, 0 , t-i-1, num_columns_output, num_columns_input, p)]; 
        end
    end
    
    beta_matrix=[beta_matrix column_matrix]; 
end

error_hankel_matrix=[]; 
error_input_matrix=(E_f); 

[num_rows, num_columns]=size(Yf_hankel); 

for i = 1 : num_columns
    column_vector=[]; 
    for t = 1 : f+1
        column_vector=[column_vector ; error_input_matrix(: , i+t-1)]; 
    end
    error_hankel_matrix=[error_hankel_matrix column_vector]; 
end

%{
display(error_input_matrix); 
display(error_hankel_matrix); 
display(output_data); 
display(Yf_hankel); 
    
assert (1<0); 

%}

OX=phi_matrix*Yf_hankel - beta_matrix*Uf_hankel-error_hankel_matrix; 

obervability_matrix_states=OX; 


end

