%Generic Test File

sig_val=2; 
num_iterates=100; 
variance=0.1; 
mean=0.0; 
x=zeros(num_iterates); 
for i=1:num_iterates 
    x(i)=get_noisy_val(2,mean,variance); 
end
plot(x); 