%Test IRLS
X=[]; 
Y=[]; 
time_samples=[]; 
for i = 1:10
    
    time_samples(i)=i; 
    X(i, :) = [i, i^2 , i^3];
    
    if (i==5)
        Y(i, 1)=2*i^2+4*i^3+100;
    else 
        Y(i, 1)=2*i^2+4*i^3;
    end
    
end


iterates=10; 
d=100000000000; 

B=IRLS(Y , X , iterates, d ); 
plot(time_samples, Y) ;
c=X\Y; 
display(transpose(B));
display(c); 



