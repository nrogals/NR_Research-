%Results Test


actual_eigenvalues=[-0.6+8j -0.2+ 0.5j]; 
actual_eigenvectors=[1 3 ; 
                     2 4 ];
                 
modeled_eigenvectors=[1 5 ; 
                     2 4 ];
modeled_eigenvalues=[-0.6+8j -0.2+ 0.5j]; 



[eig_error, eig_vec_error, x ] = calculate_error( actual_eigenvalues, actual_eigenvectors, modeled_eigenvalues, modeled_eigenvectors  );
display(x); 