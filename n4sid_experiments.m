
iterates=1000;
input_vec_length=2;
A=-0.1*[2 -1 0 ; -1 2 -1 ; 0 -1 2]; 

B=[1 2; -3  4; 5 6]; 
C=[5 -6 7 ; 8 -9 10 ; 2 4 6; -8 9 2]; 
D=[0 0; 0 0; 0 0; 0 0]; 
x0=[0; 0 ; 0]; 

[input_data, output_data, states ] = Linear_System_Data_Gen(A, B, C, D, x0, iterates, input_vec_length); 
display(states); 
display(input_data);
display(output_data);

data = iddata((output_data), input_data, 1) ; 
sys=n4sid(data,'best'); 

predicted_A=sys.A; 
t=eig(predicted_A); 
w=eig(A); 





