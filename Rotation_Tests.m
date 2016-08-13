A=[1 2 3; 
   2 9 -3; 
   3 -3 6]; 

display(A); 

Symm=A*transpose(A); 

display(Symm); 

[U, S, V]=svd(Symm); 
display(S); 

[Q,D] = eig(Symm); 
Q=transpose(Q); 

Q_1=eye(3)-2*Q(:, 1)*transpose(Q(:, 1)); 
display(Q_1);
Q_2=eye(3)-2*Q(:, 2)*transpose(Q(:,2)); 
Q_3=eye(3)-2*Q(:, 3)*transpose(Q(:,3)); 

ANS=Q_1*Q_2*Q_3; 

display(ANS); 

















    
    

