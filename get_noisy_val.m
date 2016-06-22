function [ noisy_sig_val ] = get_noisy_val( sig_val, variance_param)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
%R = normrnd(mu,sigma)
    %display Trace
    noisy_sig_val=normrnd(sig_val, variance_param);  
    
end