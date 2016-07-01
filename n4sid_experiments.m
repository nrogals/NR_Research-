

y=[1 2 3 4 5 6 7 8 9 10]; 
data = iddata(transpose(y),[],1); 
t=data.OutputData; 
display(t); 

[sys, t] = n4sid(data, 1); 
%w=get(t,'Parameters'); 
t=sys.Report.InitialState; 
display(t); 

