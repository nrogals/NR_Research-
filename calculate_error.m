function [ eig_error, eig_vec_error, x ] = calculate_error( actual_eigenvalues, actual_eigenvectors, modeled_eigenvalues, modeled_eigenvectors  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


[num_signals_eigenvectors, num_eigenvectors]= size(actual_eigenvectors); 
[num_signals_actual_eigenvectors, num_actual_eigenvectors]=size(modeled_eigenvectors); 
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
for i =1:num_eigenvectors*num_eigenvectors
    index= mod( i-1 , num_eigenvectors )+1; 
    matching=[matching index]; 
end



    
    


eig_error=0; 
eig_vec_error=0; 

end

