function [ orthog_projection ] = orthogonal_projection(Y, instrument )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

display(size(Y)); 
display(size(instrument)); 
display(size(pinv(instrument*transpose(instrument)))); 


orthog_projection=Y*transpose(instrument)*pinv(instrument*transpose(instrument))*(instrument); 



end

