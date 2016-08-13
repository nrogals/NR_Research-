function [ output_val ] = Huber(a , d)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if abs(a)>d
    output_val = d*(abs(a)-0.5*d); 
else
    output_val=0.5*a^2; 
end

