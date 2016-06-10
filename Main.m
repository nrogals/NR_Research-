%SCRIPT About MATLAB scripts and M-files.
%   A  SCRIPT file is an external file that contains a sequence
%   of MATLAB statements.  By typing the filename, subsequent 
%   MATLAB input is obtained from the file.  SCRIPT files have
%   a filename extension of ".m" and are often called "M-files". 
%   To make a SCRIPT file into a function, see FUNCTION.
%
%   See also TYPE, ECHO.

%   Copyright 1984-2002 The MathWorks, Inc. 

m=2
n=3
iterates=3


[input_data, output_data, input_coefficients, output_coefficients] = generate_data(2, 3, 5); 
display(input_data); 
display(output_data); 
display(input_coefficients); 
display(output_coefficients); 
vec_input_data= input_data(:);
vec_output_data= output_data(:); 
%plot(vec_input_data) ; 
%plot(vec_output_data); 

coefficients=model_data(m, n, input_data, output_data); 
display(coefficients); 