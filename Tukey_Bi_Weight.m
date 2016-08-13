function [ output_val ] = Tukey_Bi_Weight( a , d )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

if (abs(a/d)>1)
    output_val=1/6;
else
    output_val=(1/6)*(1-(1-(a/d)^2)^3); 

end

