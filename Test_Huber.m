%Test Huber Loss Function 

A=[1 2 -6;
   4 -5 6 ; 
   7 8 9]; 

b=[1 3 ; 2 -52 ; 3 9]; 

x=A\b;

fun= @(a) a^2; 
x0=[-0.233 0; 0.4667 0 ; 0.1 0 ]; 
x_mod = Huber_Loss_Function_Function( A , b , fun, x0 ); 

display(x); 
display(x_mod); 