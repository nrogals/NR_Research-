function [ eig_error, eig_vec_error, x ] = calculate_error(modeled_eigenvalues, modeled_eigenvectors, actual_eigenvalues, actual_eigenvectors)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


[num_signals_eigenvectors, num_eigenvectors]= size(actual_eigenvectors); 
[num_signals_actual_eigenvectors, num_actual_eigenvectors]=size(modeled_eigenvectors); 

%display(modeled_eigenvectors); 
%display(actual_eigenvectors);
%display(actual_eigenvalues); 
%display(modeled_eigenvalues); 




assert (num_signals_eigenvectors==num_signals_actual_eigenvectors); 
assert (num_eigenvectors==num_actual_eigenvectors); 

f=[]; 
for i =1 : num_eigenvectors
    for j =1:num_eigenvectors
        norm_i_j=norm(actual_eigenvectors(:, i)-modeled_eigenvectors(:,j));
        f=[f norm_i_j]; 
    end
end
b=(num_eigenvectors*num_eigenvectors)*ones(num_eigenvectors*num_eigenvectors, 1);
lb=zeros(num_eigenvectors*num_eigenvectors, 1) ; 
ub=ones(num_eigenvectors*num_eigenvectors, 1); 

A=[]; 

for i =1:num_eigenvectors 
    for w=1:num_eigenvectors
        row=zeros(1, num_eigenvectors*num_eigenvectors); 
        for t = 1: num_eigenvectors
            row((t-1)*num_eigenvectors+w)=1; 
        end
        row(num_eigenvectors*(i-1)+1: num_eigenvectors*i)=((num_eigenvectors*num_eigenvectors)-1)* ones(1, num_eigenvectors);
        A=[A;row]; 
    end
end

A=A+eye(num_eigenvectors*num_eigenvectors); 
%display(A);

x=intlinprog(f, num_eigenvectors*num_eigenvectors, [], [],  A, b, lb, ub); 



matching=[]; 
% ith acutal_eigenvector actual_eigenvector[i] is matched with modeled_eigenvectors[matching(i)]
for i =1:num_eigenvectors*num_eigenvectors
    index= mod( i-1 , num_eigenvectors )+1; 
    if (x(i)==1)
        matching=[matching index]; 
    end
end
%display(matching); 

[num_rows, num_columns]=size(matching); 

eigenvector_error=0;
eigenvalue_error=0; 
%display(matching); 
%display(actual_eigenvectors); 
%display(modeled_eigenvectors); 
%display(modeled_eigenvalues); 
%display(actual_eigenvalues); 
for i=1:num_columns
    eigenvector_error=eigenvector_error+get_percentage_error(actual_eigenvectors(:, i), modeled_eigenvectors(:, matching(i))); 
    vector=modeled_eigenvalues(matching(i)); 
    conj_vector=conj(vector); 
    eig_diff_1=abs((actual_eigenvalues(i)-vector)/actual_eigenvalues(i)); 
    eig_diff_2=abs((actual_eigenvalues(i)-conj_vector)/actual_eigenvalues(i)); 
    display(actual_eigenvalues(i)); 
    display(modeled_eigenvalues(matching(i))); 
    display(actual_eigenvalues(i)-modeled_eigenvalues(matching(i))); 
    display(eig_diff_1); 
    display(eig_diff_2); 
    eigenvalue_error=eigenvalue_error+min(eig_diff_1,eig_diff_2);  
end

eigenvector_error=eigenvector_error/num_columns; 
eigenvalue_error=eigenvalue_error/num_columns; 


eig_error=eigenvalue_error; 
eig_vec_error=eigenvector_error; 

end

