function [ projcetion_A_onto_C_along_B ] = oblique_projection(Yf , Yp, Up , Uf)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

A=Yf; 
B=Uf; 
C=[Yp; Up]; 

[num_rows,num_columns]=size(C); 

mid_matrix=pinv([C;B]*[transpose(C) transpose(B)]); 
mid_matrix_acutal=mid_matrix(: , 1:num_rows); 

projcetion_A_onto_C_along_B=A*[transpose(C) transpose(B)]*mid_matrix_acutal*C; 





%{
A=Yf; 
B=Uf; 
C=[Up; Yp]; 

Matrix=[B ; C ; A]; 

[Q_trans, L_trans]=qr(transpose(Matrix)); 

L=transpose(L_trans); 
%m by j matrix also m x j. Convert to mxm by adding padding
[num_rows , num_columns]=size(L); 

appended_matrix=zeros(num_rows, num_rows-num_columns); 

L_padded_matrix=[L appended_matrix]; 


Q=transpose(Q_trans); 
Q_padded= [Q_trans ; zeros(num_rows-num_columns, num_columns)]; 


 


%Find the number of rows in Q1, which is the same as the number of columns
%of L21. We know that L22 is square and the number of rows of L22 is equal
%to the number of rows of C. This yields the coordinates for L22. This also
%yeilds coordinates for L32. 

[A_rows, A_columns]=size(A); 
[B_rows, B_columns]=size(B); 
[C_rows, C_columns]=size(C); 

number_rows_in_Q1=1; 
%Equivalent to the number of columns in L11 and L21
terminate_number_rows=False; 
for i = 1: num_rows
    if (isequal(B, L_padded_matrix(1:B_rows, 1:number_rows_in_Q1) * Q_padded(1:number_rows_in_Q1 , 1:A_columns)))
        terminate_number_rows=True; 
        number_rows_in_Q1=number_rows_in_Q1+1;
    else
        if(terminate_number_rows)
            number_rows_in_Q1=number_rows_in_Q1; 
            
        else
            number_rows_in_Q1=number_rows_in_Q1+1; 
        end
        
    end
end


starting_column_index_L22=number_rows_in_Q1+1; 
ending_column_index=starting_column_index_L22; 
ending_index_found=False; 
for i = 1 : number_rows-starting_column_index_L22
    if (ending_index_found)
        ending_column_index=ending_column_index; 
        
    else 
        L_snippet=L_padded(num_B_rows+1 : num_B_rows+num_C_rows, ending_column_index); 
        Q_snippet=Q_padded(1:ending_column_index, :); 
        
        if isequal([B;C], L_snippet*Q_snippet)
            ending_index_found=True; 
            ending_column_index=ending_column_index+1;
        else
            ending_column_index=ending_column_index+1;
        end 
    end
end
    
L_2_2=L_padded(num_B_rows+1 : num_B_rows+num_C_rows , starting_column_index_L22:ending_column_index);
L_3_2=L_padded(num_B_rows+num_C_rows+1 : num_B_rows+num_C_rows+num_A_rows, starting_column_index_L22:ending_column_index); 

projcetion_A_onto_C_along_B=L_3_2*inv(L_2_2)*C; 
    

end
        

}%






%Matrix=[Up; Uf; Yp; Yf]; 

%[Q,R]=qr(Matrix, 0); 
%display(R); 

%assert false; 









%{

H=[Up; Uf; Yp; Yf]; 

[R,Q]=R_Q_decomp(H); 
display(R); 
display(Q); 

assert (False);

%}







%{
row_space=[Up; Uf; Yp]; 
A_project_onto_B_C=Yf*transpose(row_space)*inv(row_space*transpose(row_space))*row_space; 
Ls=A_project_onto_B_C*pinv(row_space); 
display(Ls); 

[Up_rows, Up_columns]=size(Up); 
[Uf_rows, Uf_columns]=size(Uf); 
[Yp_rows, Yp_columns]=size(Yp); 

Li_1=Ls(: , 1:Up_rows); 
Li_2=Ls(: , Up_rows+1: Up_rows+Uf_rows); 
Li_3=Ls(:, Up_rows+Uf_rows+1 : end); 

display(Li_1); 
display(Li_2); 
display(Li_3); 

projcetion_A_onto_C_along_B=[Li_1 Li_3]*[Up; Yp]; 


%}









%{

A=Yf; 
B=Uf; 
C=[Up; Yp]; 


Matrix=[B ; C ; A]; 

[Q_trans, L_trans]=qr(transpose(Matrix)); 



L=transpose(L_trans); 
Q=transpose(Q_trans);




display(L);
display(Q); 

result=L*Q; 
display(result); 
display(Matrix); 

projcetion_A_onto_C_along_B=[]; 

}%

assert (False);










%[Q_trans, R] = qr(transpose([B ; C ; A])); 

%L=transpose(R); 
%Q=transpose(Q_trans); 

%display(Q); 
%display(L); 
%R=L*Q; 
%display(R); 













%{Decomp=[transpose(B), transpose(C), transpose(A)]; 
%[Q_trans, L_trans] = ql_decomposition_reference(Decomp); 
%Q=transpose(Q_trans); 
%L=transpose(L_trans); 

%display(L); 
%display(Q); 
%projcetion_A_onto_C_along_B=[]; 

end


%}

%}

