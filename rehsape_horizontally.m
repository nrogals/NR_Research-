function [ matrix ] = rehsape_horizontally(vector, row, column)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
t=size(vector); 
length=t(1); 
matrix=zeros(row, column); 
for i = 1 : length 
    element=vector(i); 
    column=mod(i-1 , column)+1; 
    row=floor((i-1)/column)+1; 
    matrix(row, column)=element; 
end

