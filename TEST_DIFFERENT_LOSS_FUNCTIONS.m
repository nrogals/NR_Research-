%Test HUBER_LOSS_FUNCTION, Test TUKEY_LOSS_FUNCTION, TEST PARABOLIC LOST
%FUNCTION 

d=100; 

fun=@(a) Huber(a , d);
fun_1=@(a) a^2;
fun_2=@(a) Tukey_Bi_Weight(a , d);
fun_3=@(a) abs(a);


A= [1 2; 3 4; 5 6; 2 5 ];
 
x0=[0.01; 0.01 ]; 

error=100; 
x_actual=[4; 5]; 
b_actual=A*x_actual ; 
b_actual(end)=b_actual(end)+error;

 

x_0=Huber_Loss_Function_Function(A , b_actual, fun, x0);
x_1=Huber_Loss_Function_Function(A , b_actual, fun_1, x0);
x_2=Huber_Loss_Function_Function(A , b_actual, fun_2, x0);
x_3=Huber_Loss_Function_Function(A , b_actual, fun_3, x0);
x_4=A\b_actual; 

%display(x_0); 
%display(x_1); 
%display(x_2); 
%display(x_3); 
%display(x_4); 

%assert(1<0); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d=50; 

fun=@(a) Huber(a , d);
fun_1=@(a) a^2;
fun_2=@(a) Tukey_Bi_Weight(a , d);
fun_3=@(a) abs(a);


A= [1 2; -3 4; 5 6; 2 -5; 8 9; 10 11; 4 -3 ; 4 6 ; 1 7; 3 11; 8 16; 16 13; 7 9 ];
 

%x0=A\b_actual; 



error=200; 
x_actual=[-6; 19]; 
b_actual=A*x_actual ; 
b_answer=b_actual; 
mu=0; 
sigma=20; 
[num_rows, num_columns]=size(b_answer);
r=normrnd(mu,sigma,num_rows,1);
b_actual=b_actual+r; 
b_actual(end)=b_actual(end)+error;
b_actual(end-1)=b_actual(end-1)+error;

x_4=A\b_actual; 
residuals=abs(b_actual-A*x_4);
 


[num_rows, num_columns]=size(residuals); 
probability_of_outlier=0.3; 
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

probability_outlier_2=0.1;
[num_rows, num_columns]=size(new_residuals); 
number_top_residuals_2=ceil(probability_outlier_2*num_rows)-1;

d=1/new_sorted_residuals(end-number_top_residuals_2); 


x0=x_pruned; 
    



x_0=Huber_Loss_Function_Function(pruned_A , pruned_b, fun, x0);
x_1=Huber_Loss_Function_Function(pruned_A , pruned_b, fun_1, x0);
x_2=Huber_Loss_Function_Function(pruned_A , pruned_b, fun_2, x0);
x_3=Huber_Loss_Function_Function(pruned_A , pruned_b, fun_3, x0);

display(x_pruned); 
display(x_0); 
display(x_1); 
display(x_2); 
display(x_3); 
display(x_4); 
display(r);




