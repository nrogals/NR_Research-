%Test of oblique projection 

A=[1 0 0 ; 0 1 0 ; 0 1 0]; 

B= [1 0 0 ; 1 0 0] ; 

C=[0 1 0  ; 0 1 0 ]; 

T=oblique_projection(A , B , C); 

display(T); 