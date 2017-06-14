function [R]=normN(r)
% info: berechne Norm r(t,[x,y,z]) //
%
% syntax: [R]=normN(r) //
%
% input:  //
%
% output:  //
%
% example: //
%
% requires: //
%
% see also: //
%
% created with: MATLAB ver. 8.6.0.267246 (R2015b) //
% created by: T. Woehrl //
% created on: 2017-03-06 //
%
% modified:
% - on:  by:  to:
%
% disclaimer: Without warranty of any kind.//
%
%------------- BEGIN CODE ---------------
 
[R] = size(r);
R = sqrt(r(:,1).^2 + r(:,2).^2 + r(:,3).^2);
%------------- END OF CODE --------------
