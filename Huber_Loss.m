function [ x_i ] = Huber_Loss(fun_handle, A, b, x)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%w=@Weighting_Curried( fun_handle, A,  b , x); 


[num_rows, num_columns]=size(A); 
residual=A*x-b; 


error_val=0; 

for i = 1 : num_rows
    error_val_add=fun_handle(residual(i)); 
    error_val=error_val+error_val_add; 
end








w=@Weighting_Curried; 
r=w(fun_handle);
s=r(A); 
t=s(b); 

x_i= fmincon(t,x0); 
 
 




end

