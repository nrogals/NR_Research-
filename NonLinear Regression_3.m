

%Non Linear Regression 

iterates=100; 
beta=[1 ; 2 ; 3]
X=[]; 
for i= 1 : iterates
    X=[X i ]; 
    output_value = (beta(1)*i + exp^(beta(2)*i))/(i^beta(3));
    Y=[Y output_value]; 
end

beta0=[7;  8 ;  9]; 
    
beta_calc = nlinfit(X , Y , @test_function_handle, beta0) ;

display(beta_calc); 

