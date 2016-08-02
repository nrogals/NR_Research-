function [ B ] = IRLS(Y, X, iterates, d)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%min B ||y-XB||p_norm = arg min B SUM i=1 to n |yi-Xi*B|p_norm

[num_rows, num_columns]=size(X); 

weighting_matrix=eye(num_rows); 

%initialize to nothing
B=ones(num_columns,1); 


for i = 1 : iterates 
    display(weighting_matrix);
    B=inv(transpose(X)*weighting_matrix*X)*transpose(X)*weighting_matrix*Y; 
    residual=abs(Y-X*B); 
    weight=[]; 
    [num_rows, num_columns]=size(residual); 
    for i = 1 : num_rows
        if residual(i)>d
            %use linear estimation
            weight_elem=d*(abs(residual(i)-0.5*d)); 
        else
            weight_elem=0.5*residual(i)^2; 
            
        end
        weight=[weight; weight_elem]; 
    end
    
    weighting_matrix=diag(weight); 
    display(weighting_matrix);
end











