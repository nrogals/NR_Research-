

%Non Linear Regression 

iterates=15; 
beta=[0.3  2  0.2 0.9];
X=[]; 
Y=[]; 


for i= 1 : iterates
    X=[X; i ]; 
    output_value = (beta(1)*i + (beta(2)*i^2)+(beta(3)*i^3))^beta(4);
    %display(output_value) ;
    Y=[Y; output_value]; 

end

beta0=[0.9  15  0.2 0.1]; 
display(X);
display(Y)
    
beta_calc = nlinfit(X , Y , @test_function_handle, beta0) ;

display(beta_calc); 

