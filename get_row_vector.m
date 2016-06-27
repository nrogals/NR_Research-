function [updated_row]= get_row_vector(reccurence_array, row_vector, sig_index, sample_index, guess_num, sig_num)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here


   for i = 1:guess_num
       beginning=(i-1)*sig_num^2+(sig_index)*sig_num+1; 
       ending=(i-1)*sig_num^2+(sig_index+1)*sig_num; 
       
       
       %display(beginning); 
       %display(ending); 
       %display(sample_index) 
       vals=reccurence_array(sample_index, i, :); 
       %display 'Past'
       row_vector(beginning:ending)=vals; 
       %display(row_vector)
       
   end
   %display 'Final Row Vector'
   %display(row_vector); 
    %display 'Final Row Vector'
   updated_row=row_vector; 


end

