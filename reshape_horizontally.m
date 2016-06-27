function [ matrix ] = reshape_horizontally(vector, row_number)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
t=size(vector); 
length=t(1); 
matrix=zeros(row_number); 
for i = 1 : length 
    element=vector(i); 
    column=mod(i-1 , row_number)+1; 
    row=floor((i-1)/row_number)+1; 
    matrix(row, column)=element; 
end

