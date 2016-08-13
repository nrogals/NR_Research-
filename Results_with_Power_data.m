%n4sid

load 9busContig1.mat

[coefficient_mode_matrix, eigenvalues]=generate_linearizied_results(data); 


time_step=1; 
num_samples=60; 
guess_num_modes=2; 
  
number_of_iterates=10;

n4sid_cva_error_eigenvalues_list=[]; 
n4sid_cva_error_mean_eigenvector_list=[]; 
n4sid_SSARX_error_mean_eigenvector_list=[]; 
n4sid_SSARX_error_eigenvalues_list=[]; 
n4sid_MOESP_error_mean_eigenvector_list=[]; 
n4sid_MOESP_error_mean_eigenvalues_list=[]; 
n4sid_vector_prony_error_mean_eigenvector_list=[]; 
n4sid_vector_prony_error_mean_eigenvalue_list=[];

%SSARX_MLR_error_mean_eigenvalue_list
SSARX_MLR_error_mean_eigenvector_list=[]; 
SSARX_MLR_error_mean_eigenvalue_list=[]; 

SSARX_HUBER_LOSS_error_mean_eigenvector_list=[]; 
SSARX_HUBER_LOSS_error_mean_eigenvalue_list=[]; 

SSARX_Parabolic_LOSS_error_mean_eigenvalue_list=[]; 
SSARX_Parabolic_LOSS_error_mean_eigenvector_list=[]; 


SSARX_Tukey_Biweight_LOSS_error_mean_eigenvalue_list=[];
SSARX_Tukey_Biweight_LOSS_error_mean_eigenvector_list=[]; 



%noise_model='Normal';
noise_model='Normal_with_Outliers'; 
probability_of_outlier=0.1; 
outlier_magnitude=10; 

initial_noise_variance=0.00000000000000000001; 
noise_variance=initial_noise_variance; 
noise_parameters=[initial_noise_variance; probability_of_outlier; outlier_magnitude]; 
%noise_parameters
num_noise_steps=10; 

for i = 1:num_noise_steps
vector_prony_error=[]; 
n4sid_SSARX_error=[]; 
n4sid_MOESP_error=[]; 
n4sid_cva_error=[]; 
SSARX_MLR_error=[]; 
SSARX_HUBER_LOSS_error=[];
SSARX_Parabolic_LOSS_error=[]; 
SSARX_Tukey_Biweight_LOSS_error=[]; 


noise_variance=initial_noise_variance*3.333^i; 
noise_variances(i)=(noise_variance); 


%Settings:
tikhonov_regularization=0.00000000000000001; 
minimum_singular_value=1; 
%determines how much we want to keep of information. 
outlier_value=10; 
%d in the literature 

p=5;
%In SSARX
j=5; 

f=3; 


doubled_coefficient_mode_matrix=[]; 
doubled_eigenvalues=[]; 
[num_rows, num_eigenvectors]=size(coefficient_mode_matrix); 
for i=1:num_eigenvectors
    doubled_coefficient_mode_matrix=[doubled_coefficient_mode_matrix calculate_mode_shape_vector(coefficient_mode_matrix(:, i)), calculate_mode_shape_vector(coefficient_mode_matrix(:, i))]; 
    doubled_eigenvalues=[doubled_eigenvalues eigenvalues_without_congugate(:, i), conj(eigenvalues_without_congugate(:, i))]; 
end


for i= 1 : number_of_iterates 
    %Get data; 
    
    [samples,time_samples]=get_data(coefficient_mode_matrix, eigenvalues_without_congugate, num_signals, num_eigenvals, time_step, num_samples, noise_parameters, noise_model);
    data=(samples); 
    output_data=samples; 
    [num_rows, num_columns]=size(output_data); 
    input_data=zeros(3,num_columns); 
    
    
    %n4sid_cva
    [eigenvalues, eigenvectors]=n4sid_cva(output_data ); 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
    n4sid_cva_error=[n4sid_cva_error [eig_error; eig_vec_error]];
    
    
    %n4sid_SSARX
    try
        [eigenvalues, eigenvectors]=n4sid_SSARX(output_data); 
        [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
        n4sid_SSARX_error=[n4sid_SSARX_error [eig_error; eig_vec_error]];
    catch 
        r=3; 
    end
    
    
    %n4sid_MOESP
    [eigenvalues, eigenvectors]=n4sid_MOESP(output_data);
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
    n4sid_MOESP_error=[n4sid_MOESP_error [eig_error; eig_vec_error]]; 
    
    
    %Vector PRONY
    [eigenvectors, eigenvalues]=vector_prony((data), guess_num_modes, tikhonov_regularization); 
    [num_rows, num_columns]=size(eigenvectors); 
    mode_shape_eigenvectors=[]; 
    for r = 1 : num_columns
        mode_shape_eigenvectors=[mode_shape_eigenvectors calculate_mode_shape_vector(eigenvectors(:, r))]; 
    end
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, mode_shape_eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
    vector_prony_error=[vector_prony_error [eig_error; eig_vec_error]]; 
    
    %Transpose data for input to SSARX_<XXX>
    input_data=transpose(input_data); 
    output_data=transpose(output_data); 
   
    
    %SSARX_MLR
    [eigenvalues, eigenvectors] = SSARX_MLR( input_data, output_data, p, f, minimum_singular_value); 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix);
    SSARX_MLR_error=[SSARX_MLR_error [eig_error; eig_vec_error]]; 
    
    
    %SSARX_HUBER_LOSS
    [eigenvalues, eigenvectors ] = SSARX_HUBER_LOSS( input_data, output_data, p, f, minimum_singular_value, outlier_value); 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix); 
    SSARX_HUBER_LOSS_error=[SSARX_HUBER_LOSS_error [eig_error; eig_vec_error]]; 
    
    %SSARX_Parabolic_LOSS
    [eigenvalues, eigenvectors ] = SSARX_Parabolic_LOSS( input_data, output_data, p, f, minimum_singular_value); 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix);
    SSARX_Parabolic_LOSS_error=[SSARX_Parabolic_LOSS_error [eig_error; eig_vec_error]]; 
    
     %SSARX_Tukey_Biweight_LOSS
    [eigenvalues, eigenvectors] = SSARX_Tukey_Biweight_LOSS( input_data, output_data, p, f, minimum_singular_value, outlier_value); 
    [eig_error, eig_vec_error]=calculate_error(eigenvalues, eigenvectors, doubled_eigenvalues, doubled_coefficient_mode_matrix);
    SSARX_Tukey_Biweight_LOSS_error=[SSARX_Tukey_Biweight_LOSS_error [eig_error; eig_vec_error]]; 
end


n4sid_cva_error_mean_eigenvalues=mean(n4sid_cva_error(1, :)); 
n4sid_cva_error_mean_eigenvectors=mean(n4sid_cva_error(2, :)); 
n4sid_cva_error_eigenvalues_list=[n4sid_cva_error_mean_eigenvalues n4sid_cva_error_eigenvalues_list]; 
n4sid_cva_error_mean_eigenvector_list=[n4sid_cva_error_mean_eigenvectors n4sid_cva_error_mean_eigenvector_list]; 


n4sid_SSARX_error_error_mean_eigenvalues=mean(n4sid_SSARX_error(1, :)); 
n4sid_SSARX_error_mean_eigenvectors=mean(n4sid_SSARX_error(2, :)); 
n4sid_SSARX_error_eigenvalues_list=[n4sid_SSARX_error_error_mean_eigenvalues n4sid_SSARX_error_eigenvalues_list]; 
n4sid_SSARX_error_mean_eigenvector_list=[n4sid_SSARX_error_mean_eigenvectors n4sid_SSARX_error_mean_eigenvector_list]; 


n4sid_MOESP_error_mean_eigenvalues=mean(n4sid_MOESP_error(1, :)); 
n4sid_MOESP_error_mean_eigenvectors=mean(n4sid_MOESP_error(2, :)); 
n4sid_MOESP_error_mean_eigenvalues_list=[n4sid_MOESP_error_mean_eigenvalues n4sid_MOESP_error_mean_eigenvalues_list]; 
n4sid_MOESP_error_mean_eigenvector_list=[n4sid_MOESP_error_mean_eigenvectors n4sid_MOESP_error_mean_eigenvector_list];  


vector_prony_error_mean_eigenvalues=mean(vector_prony_error(1, :)); 
vector_prony_error_mean_eigenvectors=mean(vector_prony_error(2, :)); 
n4sid_vector_prony_error_mean_eigenvalue_list=[vector_prony_error_mean_eigenvalues n4sid_vector_prony_error_mean_eigenvalue_list]; 
n4sid_vector_prony_error_mean_eigenvector_list=[vector_prony_error_mean_eigenvectors n4sid_vector_prony_error_mean_eigenvector_list];


vector_prony_error_mean_eigenvalues=mean(vector_prony_error(1, :)); 
vector_prony_error_mean_eigenvectors=mean(vector_prony_error(2, :)); 
n4sid_vector_prony_error_mean_eigenvalue_list=[vector_prony_error_mean_eigenvalues n4sid_vector_prony_error_mean_eigenvalue_list]; 
n4sid_vector_prony_error_mean_eigenvector_list=[vector_prony_error_mean_eigenvectors n4sid_vector_prony_error_mean_eigenvector_list];

SSARX_MLR_error_mean_eigenvalues=mean(SSARX_MLR_error(1, :)); 
SSARX_MLR_error_mean_eigenvectors=mean(SSARX_MLR_error(2, :)); 
SSARX_MLR_error_mean_eigenvalue_list=[SSARX_MLR_error_mean_eigenvalues SSARX_MLR_error_mean_eigenvalue_list]; 
SSARX_MLR_error_mean_eigenvector_list=[SSARX_MLR_error_mean_eigenvectors SSARX_MLR_error_mean_eigenvector_list ];

SSARX_HUBER_LOSS_error_mean_eigenvalues=mean(SSARX_HUBER_LOSS_error(1, :)); 
SSARX_HUBER_LOSS_error_mean_eigenvectors=mean(SSARX_HUBER_LOSS_error(2, :)); 
SSARX_HUBER_LOSS_error_mean_eigenvalue_list=[SSARX_HUBER_LOSS_error_mean_eigenvalues SSARX_HUBER_LOSS_error_mean_eigenvalue_list]; 
SSARX_HUBER_LOSS_error_mean_eigenvector_list=[SSARX_HUBER_LOSS_error_mean_eigenvectors SSARX_HUBER_LOSS_error_mean_eigenvector_list];

SSARX_Parabolic_LOSS_error_mean_eigenvalues=mean(SSARX_Parabolic_LOSS_error(1, :)); 
SSARX_Parabolic_LOSS_error_mean_eigenvectors=mean(SSARX_Parabolic_LOSS_error(2, :)); 
SSARX_Parabolic_LOSS_error_mean_eigenvalue_list=[SSARX_Parabolic_LOSS_error_mean_eigenvalues SSARX_Parabolic_LOSS_error_mean_eigenvalue_list]; 
SSARX_Parabolic_LOSS_error_mean_eigenvector_list=[SSARX_Parabolic_LOSS_error_mean_eigenvectors SSARX_Parabolic_LOSS_error_mean_eigenvector_list];

SSARX_Tukey_Biweight_LOSS_error_mean_eigenvalues=mean(SSARX_Tukey_Biweight_LOSS_error(1, :)); 
SSARX_Tukey_Biweight_LOSS_error_mean_eigenvectors=mean(SSARX_Tukey_Biweight_LOSS_error(2, :)); 
SSARX_Tukey_Biweight_LOSS_error_mean_eigenvalue_list=[SSARX_Tukey_Biweight_LOSS_error_mean_eigenvalues SSARX_Tukey_Biweight_LOSS_error_mean_eigenvalue_list]; 
SSARX_Tukey_Biweight_LOSS_error_mean_eigenvector_list=[SSARX_Tukey_Biweight_LOSS_error_mean_eigenvectors SSARX_Tukey_Biweight_LOSS_error_mean_eigenvector_list];


end 

display(n4sid_SSARX_error_eigenvalues_list); 
display(SSARX_MLR_error_mean_eigenvalue_list); 
display(SSARX_HUBER_LOSS_error_mean_eigenvalue_list); 
display(SSARX_Parabolic_LOSS_error_mean_eigenvalue_list); 
display(SSARX_Tukey_Biweight_LOSS_error_mean_eigenvalue_list); 




