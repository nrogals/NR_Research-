function [ eigenvalues, eigenvectors ] = n4sid_MOESP( output_data )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


opt=n4sidOptions('N4Weight', 'MOESP'); 
data = iddata(transpose(output_data), [], 'Form', 'modal') ; 
sys=n4sid(data,'best'); 
A=sys.A;
[V,D] = eig(A); 
eigenvectors=V; 
eigenvalues=diag(D); 


end
