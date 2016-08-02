function [ eig_error, eig_vec_error, x ] = calculate_error(modeled_eigenvalues, modeled_eigenvectors, actual_eigenvalues, actual_eigenvectors)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


[num_signals_eigenvectors, num_eigenvectors]= size(actual_eigenvectors); 
[num_signals_actual_eigenvectors, num_actual_eigenvectors]=size(modeled_eigenvectors); 

display(modeled_eigenvectors); 
display(actual_eigenvectors);
display(actual_eigenvalues); 
display(modeled_eigenvalues); 




assert (num_signals_eigenvectors==num_signals_actual_eigenvectors); 
assert (num_eigenvectors==num_actual_eigenvectors); 

f=[]; 
for i =1 : num_eigenvectors
    for j =1:num_eigenvectors
        norm_i_j=norm(actual_eigenvectors(:, i)-modeled_eigenvectors(:,j));
        f=[f norm_i_j]; 
    end
end
b=ones(num_eigenvectors*num_eigenvectors, 1);
lb=zeros(num_eigenvectors*num_eigenvectors, 1) ; 
ub=ones(num_eigenvectors*num_eigenvectors, 1); 

A=[]; 

for i =1:num_eigenvectors
    row=zeros(1, num_eigenvectors*num_eigenvectors); 
    row(num_eigenvectors*(i-1)+1: num_eigenvectors*i)=ones(1, num_eigenvectors); 
    for w=1:num_eigenvectors
        A=[A;row]; 
    end
end
display(A); 
display(f); 


x=intlinprog(f, num_eigenvectors*num_eigenvectors, [], [],  A, b, lb, ub); 

matching=[]; 
% ith acutal_eigenvector actual_eigenvector[i] is matched with modeled_eigenvectors[matching(i)]
for i =1:num_eigenvectors*num_eigenvectors
    index= mod( i-1 , num_eigenvectors )+1; 
    matching=[matching index]; 
end

[num_rows, num_columns]=size(matching); 

eigenvector_error=0;
eigenvalue_error=0; 
for i=1:num_rows
    accum_error=accum_error+norm(actual_eigenvector(i)-modeled_eigenvector(matching(i))); 
    eigenvalue_error=eigenvalue_error+abs(actual_eigenvalues(i)-modeled_eigenvalues(matching(i))); 
end



eig_error=eigenvalue_error; 
eig_vec_error=eigenvector_error; 

end

