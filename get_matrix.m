function [vector_matrix] = get_matrix(data, time, guess_mode_num)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
vector_matrix=[];

for i = 1:guess_mode_num
    vector_matrix(:,i)=transpose(data(:, time-i)); 
    %vector_matrix(:,i)=(data(:, time-i)); 
    
end

