%SCRIPT About MATLAB scripts and M-files.
%   A  SCRIPT file is an external file that contains a sequence
%   of MATLAB statements.  By typing the filename, subsequent 
%   MATLAB input is obtained from the file.  SCRIPT files have
%   a filename extension of ".m" and are often called "M-files". 
%   To make a SCRIPT file into a function, see FUNCTION.
%
%   See also TYPE, ECHO.

%   Copyright 1984-2002 The MathWorks, Inc. 

m=2; 
n=10; 
iterates=20; 

m_model=2; 
n_model=10; 

[input_data, output_data, input_coefficients, output_coefficients] = generate_data(m, n, iterates); 
display(input_data); 
display(output_data); 
display(input_coefficients); 
display(output_coefficients); 
vec_input_data= input_data(:);
vec_output_data= output_data(:); 
%plot(vec_input_data) ; 
%plot(vec_output_data); 

[coefficients, norm_error]=model_data(m_model, n_model, input_data, output_data); 
display(coefficients); 
display(norm_error); 