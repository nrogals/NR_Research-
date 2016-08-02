function [ R, Q ] = R_Q_decomp( A )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
A_flipped_up_down =  flipud(A); 
[Q_bar, R_bar]=qr(transpose(A_flipped_up_down)); 
Q=transpose(Q_bar); 
R=flipud(transpose(R_bar)); 

end

