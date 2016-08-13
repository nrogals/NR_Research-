function [ complex_roots ] = hard_coded_poly_eig(coefficient_matricies, guess_num, num_signals)
%UNTITLED4 Summary of this function goes here
%  guess_num is the number of matricies you have 

identity=eye(num_signals); 
assert (guess_num<11); 

if (guess_num==1)
    t_1=transpose(coefficient_matricies(1:num_signals ,  :));
    complex_roots=polyeig((-1*t_1 ),  identity);

    
elseif (guess_num==2) 
    t_1=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    %display(num_signals); 
    %display(coefficient_matricies) ;
    t_2=transpose(coefficient_matricies(1:num_signals ,  :));
    complex_roots=polyeig((-1*t_2), (-1*t_1 ),  identity);
    
    
    
elseif (guess_num==3)
    t_1=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    %display(num_signals); 
    %display(coefficient_matricies) ;
    t_2=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_3=transpose(coefficient_matricies(1:num_signals ,  :));
    complex_roots=polyeig((-1*t_3), (-1*t_2), (-1*t_1 ),  identity);
    
elseif(guess_num==4)
    t_1=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    %display(num_signals); 
    %display(coefficient_matricies) ;
    t_2=transpose(coefficient_matricies(1:num_signals ,  :));

    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);

    t_3=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_4=transpose(coefficient_matricies(1:num_signals ,  :));
    
   
    complex_roots=polyeig((-1*t_4), (-1*t_3), (-1*t_2), (-1*t_1 ),  identity);
    
    
elseif(guess_num==5)
    t_1=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    %display(num_signals); 
    %display(coefficient_matricies) ;
    t_2=transpose(coefficient_matricies(1:num_signals ,  :));

    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);

    t_3=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    
    t_4=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_5=transpose(coefficient_matricies(1:num_signals ,  :));
    
    complex_roots=polyeig((-1*t_5), (-1*t_4), (-1*t_3), (-1*t_2), (-1*t_1 ),  identity);
    
    
    
    
    
elseif(guess_num==6) 
    t_1=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    %display(num_signals); 
    %display(coefficient_matricies) ;
    t_2=transpose(coefficient_matricies(1:num_signals ,  :));

    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);

    t_3=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    
    t_4=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_5=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_6=transpose(coefficient_matricies(1:num_signals ,  :));
    complex_roots=polyeig((-1*t_6), (-1*t_5), (-1*t_4), (-1*t_3), (-1*t_2), (-1*t_1 ),  identity);
   
    
    
elseif(guess_num==7)
   t_1=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    %display(num_signals); 
    %display(coefficient_matricies) ;
    t_2=transpose(coefficient_matricies(1:num_signals ,  :));

    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);

    t_3=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    
    t_4=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_5=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_6=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_7=transpose(coefficient_matricies(1:num_signals ,  :));
    complex_roots=polyeig((-1*t_7), (-1*t_6), (-1*t_5), (-1*t_4), (-1*t_3), (-1*t_2), (-1*t_1 ),  identity);
    
    
elseif(guess_num==8)
    t_1=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    %display(num_signals); 
    %display(coefficient_matricies) ;
    t_2=transpose(coefficient_matricies(1:num_signals ,  :));

    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);

    t_3=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    
    t_4=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_5=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_6=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_7=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_8=transpose(coefficient_matricies(1:num_signals ,  :)); 
    complex_roots=polyeig((-1*t_8), (-1*t_7), (-1*t_6), (-1*t_5), (-1*t_4), (-1*t_3), (-1*t_2), (-1*t_1 ),  identity);
    
elseif(guess_num==9)
    t_1=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    %display(num_signals); 
    %display(coefficient_matricies) ;
    t_2=transpose(coefficient_matricies(1:num_signals ,  :));

    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);

    t_3=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    
    t_4=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_5=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_6=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_7=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_8=transpose(coefficient_matricies(1:num_signals ,  :)); 
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_9=transpose(coefficient_matricies(1:num_signals ,  :));
    complex_roots=polyeig((-1*t_9), (-1*t_8), (-1*t_7), (-1*t_6), (-1*t_5), (-1*t_4), (-1*t_3), (-1*t_2), (-1*t_1 ),  identity);
    
elseif(guess_num==10)
    t_1=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    %display(num_signals); 
    %display(coefficient_matricies) ;
    t_2=transpose(coefficient_matricies(1:num_signals ,  :));

    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);

    t_3=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    
    t_4=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_5=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_6=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_7=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_8=transpose(coefficient_matricies(1:num_signals ,  :)); 
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_9=transpose(coefficient_matricies(1:num_signals ,  :));
    coefficient_matricies=coefficient_matricies(num_signals+1:end ,:);
    t_10=transpose(coefficient_matricies(1:num_signals ,  :));
    complex_roots=polyeig((-1*t_10), (-1*t_9), (-1*t_8), (-1*t_7), (-1*t_6), (-1*t_5), (-1*t_4), (-1*t_3), (-1*t_2), (-1*t_1 ),  identity);
    
else
    assert(False); 

end

