function [ x_accum ] = Huber_Loss_Function_Function( A , B , fun_handle, x_useless, probability_outlier_1, probability_outlier_2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%fun_handle takes in x and d my_fun=(@d)(@x) expression

[num_rows, num_columns]=size(B);  

x_accum=[]; 
for i = 1 : num_columns
    b_actual=B(:, i); 
    %Do Pruning
    x_4=A\b_actual; 
    residuals=abs(b_actual-A*x_4);



    [num_rows, num_columns]=size(residuals); 
    probability_of_outlier=probability_outlier_1;  
    num_top_residuals=ceil(probability_of_outlier*num_rows)-1; 
    sorted_residuals=sort(residuals);
    highest_residual=sorted_residuals(end-num_top_residuals); 



    pruned_A=[]; 
    pruned_b=[]; 

    for i = 1 : num_rows
        if (residuals(i)>=highest_residual)
            t=3;  
        else
            pruned_A=[pruned_A; A(i, :)];
            pruned_b=[pruned_b; b_actual(i, :)]; 
        end
    end


    %display(b_actual); 
    %display(b_answer); 
    %display(residuals);
    %display(sorted_residuals); 
    %display(highest_residual)
    %display(pruned_b); 


    x_pruned=pruned_A\pruned_b; 



    new_residuals=pruned_A*x_pruned-pruned_b; 
    new_sorted_residuals=sort(new_residuals); 

    [num_rows, num_columns]=size(new_residuals); 
    number_top_residuals_2=ceil(probability_outlier_2*num_rows)-1;

    d=1/new_sorted_residuals(end-number_top_residuals_2); 


    x0=x_pruned; 
    %Pruning Done and setting of d
    fun_handle_miss_val=fun_handle(d); 
    
    x_i=fmincon(@(x) Huber_weigting_function(pruned_A*x-pruned_b, fun_handle_miss_val),x0,[],[]);
    x_accum=[x_accum x_i];
    
end
 


