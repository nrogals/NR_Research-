function [Q, L]=ql_decomposition_reference(A)
%
% Purpose : Compute the QL decomposition of a matrix such that,
%       Q L = A
%
% Use (syntax): [Q L] = ql(A)
%
% Input Parameters :
%   A: a matrix
%
% Return Parameters :
%   L: is a lower trinagular matrix
%   Q: is a unitary matrix Q' * Q = I
%
% Description and algorithms:
%
% References : 
%
% Author :  Matther Harker and Paul O'Leary
% Date :    29. Jan 2013
% Version : 1.0
%
% (c) 2013 Matther Harker and Paul O'Leary
% url: www.harkeroleary.org
% email: office@harkeroleary.org
%
% History:
%   Date:           Comment:

[Qi Ri]=qr(fliplr(A));
%
% Map the results
%
L=fliplr(flipud(Ri));
Q=fliplr(Qi);