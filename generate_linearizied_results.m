function [mode_matrix, eigenvalues ] = generate_linearizied_results( data, order )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

data_object= iddata((data), []) ; 

sys=n4sid(data_object, order, 'Form', 'canonical'); 
A=sys.A; 
C=sys.C; 
[V,D]=eig(A); 
[num_rows, num_columns]=size(V); 
mode_matrix=[]; 

for i = 1:num_columns
    mode_matrix=[mode_matrix C*V(:,i)]; 
end

A_eigenvalues=eig(A); 
eigenvalues=[]; 

for i = 1 : num_rows
    eigenvalues=[eigenvalues log(A_eigenvalues(i))];
end



    






    






end

