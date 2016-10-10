%The scipt here compares the results from N4SID and SSARX in computing the
%observability matrix * the state matrix. I do this by formulating the
%obervabiliity matrix * the state matrix and comparing the two. 


A=-0.1*[2 -1 0 ; -1 2 -1 ; 0 -1 2]; 

B=[1 2; -3  4; 5 6]; 
C=[5 -6 7 ; 8 -9 10 ; 2 4 6; -8 9 2]; 
D=[0 0; 0 0; 0 0; 0 0]; 
x0=[0; 0 ; 1]; 

%The input_indactor==0 signifies no input. input_indicator==1 signifies
%that there is input

input_indicator=1; 

%indicator==1 iff there is non-zero input. 

%input_modifier is a scalar modifier for the uniform distribution of the
%input input_modifier* [-1,1]

input_modifier=1; 

%iterates is the number of elements in the generated sequence

iterates=25; 

%observation_variance_param gives the std of the gaussian noise on the
%ouput y

observation_variance_param=0.01; 


%state_variance_param gives the std of the gaussian noise on the x equation
%for state propogation 

state_variance_param=0.01; 

%model indicator gives the relation between the gaussian error on the input
%and the gaussian error on the output. If model_indicator==1, then we have
%that y = stuff + K(observed_state_noise). When this is equal to 1, then
%the independent gaussian noise on the output is overwritten. 

model_indicator=0; 

% K is the input for the equation above. 

[input_data, output_data, states ] = Linear_System_Data_Gen(A, B, C, D, [], x0, iterates, input_vec_length, input_indicator, input_modifier, observation_variance_param, state_variance_param, model_indicator); 



%Define f as parameter. Let i = f. Let j = N-2f. Let the input to N4SID be
%uf...uN-1 and yf ...yN-1




f=10; 

input_N4SID = input_data(f:end , :); 
output_N4SID= output_data(f:end,:); 

[num_rows, num_columns]=size(input_data); 

j=num_rows-2*f; 
i=f; 



Z_I_N4SID = N4SID_Obervability_Matrix( input_N4SID, output_N4SID , j , i); 

p=f; 


minimum_singular_value=0.001; 


Z_I_SSARX = SSARX_Obervability_Matrix( input_data, output_data, p, f, minimum_singular_value, f); 

%The return values should be [C CA ... CA^(f-1)]^T * [xf...xN-f]

%We form the actual return value, with no error. 

states_truncated=states(:, f:end); 

obervability_matrix=form_observability_matrix(C , A , f); 

actual_projection = obervability_matrix * states(: , f+1:end-f-1); 



display(actual_projection) ;

display(Z_I_N4SID); 

display(Z_I_SSARX) ;




















