function [ eigenvalues, eigenvectors ] = n4sid_SSARX( output_data, order )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here



opt=n4sidOptions('N4Weight', 'SSARX'); 
data = iddata(transpose(output_data), []) ; 
display(output_data); 
sys=n4sid(data, order, 'Form', 'free', opt); 

C=sys.C; 
[V,D] = eig(sys.A); 

[eigenvectors, eigenvalues]=convert_eigenvectors_to_modeshapes(C, V, diag(D)); 


%transpose data in
%Fix A to sys.A
%Fix diag to 







end
