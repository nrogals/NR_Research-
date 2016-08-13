function [eigenvalues_without_conjugate, coefficient_mode_matrix ] = collapse_doubles( doubled_coefficient_mode_matrix, doubled_eigenvalues)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

eigenvalues_without_conjugate=[]; 
coefficient_mode_matrix=[]; 
[num_rows, num_columns]=size(doubled_coefficient_mode_matrix); 

count=1; 
for i = 1 : num_columns
    if (count<num_columns)
        if (doubled_eigenvalues(count)==conj(doubled_eigenvalues(count+1)))
            eigenvalues_without_conjugate=[eigenvalues_without_conjugate , doubled_eigenvalues(count)]; 
            coefficient_mode_matrix=[coefficient_mode_matrix, doubled_coefficient_mode_matrix(:, count)]; 
            count=count+2; 
        else
            eigenvalues_without_conjugate=[eigenvalues_without_conjugate , doubled_eigenvalues(count)]; 
            coefficient_mode_matrix=[coefficient_mode_matrix, doubled_coefficient_mode_matrix(:, count)]; 
            count=count+1; 
        end
    else 
        t=2; 
    end
end


        
    



end

