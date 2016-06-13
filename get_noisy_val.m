function [ noisy_sig_val ] = get_noisy_val( sig_val, mean, variance_param)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
%R = normrnd(mu,sigma)
    %display Trace
    noisy_sig_val=sig_val+normrnd(mean , sig_val*variance_param);  
    


end

