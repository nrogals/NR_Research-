%Huber Loss Function 

%Huber Loss Function is given by Ld(a)={abs(a)<d, =0.5a^2 and abs(a)>
%d*(abs(a)-0.5*d)


A=[3 4 ; 5 6 ; 7 8]; 
B=[8 9 ; -2 5; 7 3]; 
x0=[8 ; 9 ]; 
display(A); 
display(B); 



%{
x=A\B; 
display(x); 

if abs(a)<d output_val=0.5*a^2; 
else
    output_val=d*(abs(a)-0.5*d); 
end;
%}

d=0.25; 
%change r to the weighting function 
r=@(a)@(d) abs(a); 


s=r(d); 

X=Huber_Loss_Function_Function( A , B , s, x0); 

