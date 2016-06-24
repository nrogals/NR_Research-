function [updated_row]= get_row_vector(reccurence_array, row_vector, sig_index, sample_index, guess_num, sig_num)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here


   for i = 1:guess_num
       beginning=(i-1)*sig_num^2+(sig_index)*sig_num+1; 
       ending=(i-1)*sig_num^2+(sig_index+1)*sig_num; 
       
       
       display(beginning); 
       display(ending); 
       vals=reccurence_array(sample_index, i, :); 
       row_vector(beginning:ending)=vals; 
       
   end
   display(row_vector); 
   updated_row=row_vector; 


end

