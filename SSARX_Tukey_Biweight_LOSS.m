function [ eigenvalues, eigenvectors ] = SSARX_Tukey_Biweight_LOSS(input_data, output_data, p, f , minimum_singular_value, d, fixed_order,  probability_outlier_1, probability_outlier_2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[Up Yp Yf Yf_hankel Uf_hankel]=create_Hankel_SSARX( input_data, output_data , p, f ); 
Wp=[Up ; Yp]; 


%assert(1<0);


[num_rows, num_columns_input] = size(input_data); 
[num_rows, num_columns_output]=size(output_data);

x0=zeros(num_columns_output, p*num_columns_input+p*num_columns_output); 

fun=@(e)@(a) Tukey_Bi_Weight(a, e); 
WP_trans=transpose(Wp); 
Yf_trans=transpose(Yf); 
x0=transpose(x0); 

O_matrix_trans= Huber_Loss_Function_Function(WP_trans, Yf_trans, fun, x0, probability_outlier_1, probability_outlier_2);
O_matrix=transpose(O_matrix_trans); 

O_matrix_2=Yf*transpose(Wp)*pinv(Wp*transpose(Wp)); 

%Huber_Loss_Function_Function( A , B , s, x0);

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
            display(add_matrix); 
            
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
%minus error also

[U,S,V] = svd(OX); 
[num_rows, num_columns]=size(S); 
order=0; 
for i = 1 : min(num_rows, num_columns)
    if (S(i,i)>minimum_singular_value)
        order=order+1; 
    end
end
if (fixed_order<0)
    b=4; 
else
    order=fixed_order; 
end

U_1=U(:, 1:order); 
tau=U_1; 
X=transpose(U_1)*OX; 
[number_of_states, num_columns]=size(X); 

X_p_1 =X(: , 2:end); 
Xp_min_1 = X(:, 1:end-1); 
U_row=Uf_hankel(1:num_columns_input, 1:end-1); 
Y_row=Yf_hankel(1:num_columns_output, 1:end-1); 



%X_p_1 = [A_bar B K] * [Xp_min_1; U_row, Y_row] 

matrix_trans=transpose([Xp_min_1; U_row; Y_row])\transpose(X_p_1); 

matrix=transpose(matrix_trans); 













%display(tau) ;

R=E_f(:, 1:end-f); 

display(R);
[num_rows_2, num_columns_2]=size(R); 
display(Yf_hankel(1:num_columns_output, num_columns_2)); 
C_trans=transpose(X)\transpose(Yf_hankel(1:num_columns_output, 1: num_columns_2)-R); 

C=transpose(C_trans);
display(matrix);
A_bar=matrix(: , 1:number_of_states);
B=matrix(:, number_of_states+1:number_of_states+num_columns_input); 
K=matrix(:, end-num_columns_output+1:end);  
A=A_bar+K*C; 

%{

display(input_data); 
display(output_data) ; 
display(Up); 
display(Yp); 
display(Yf); 
display(Yf_hankel); 
display(Uf_hankel); 
display(O_matrix);
display(phi_matrix); 
display(beta_matrix);
display(OX);
display(S); 
display(tau); 
display(X); 
display(order);
display(X_p_1); 
display(Xp_min_1); 
display(U_row); 
display(Y_row); 
display(A); 
display(B); 
display(C); 
display(K);

display(eig(A));
%}


[V , D]=eig(A); 
[eigenvectors_1, eigenvalues_1]=convert_eigenvectors_to_modeshapes(C, V, diag(D)); 
eigenvalues=eigenvalues_1; 
eigenvectors=eigenvectors_1; 




end
