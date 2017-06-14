function [x2]=interp1_xn(x1,n)
% info: interpolate m cols with linspace to n values //
%
% syntax: [x2]=interp1_xn(x1,n) //
%
% input: x1_double_k_x_l n_double_1_x_1 //
%
% output: x2_double_n_x_l //
%
% example: //
%
% requires: //
%
% see also: //
%
% created with: MATLAB ver. 8.6.0.267246 (R2015b) //
% created by: T. Woehrl //
% created on: 2017-03-01 //
%
% modified:
% - on:  by:  to:
%
% disclaimer: Without warranty of any kind. //
%
%------------- BEGIN CODE ---------------
[o,p] = size(x1);
for k = 1:p
    ta = 1:o;
    tn = linspace(1,length(ta),n);
    x2(1:n,k) = interp1(ta,x1(:,k),tn);
end
%------------- END OF CODE --------------
