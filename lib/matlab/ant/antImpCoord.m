function [Xint,Xcut,err] = antImpCoord(filepaths, IDs, marker, tds, los, xis, tInt)
% info: imports kinematic data //
%
% syntax: [Xint,Xcut,err] = antImpCoord(filepaths, IDs, marker, tds, los,
% xis, tInt) //
%
% input: cell, cell, char, double, double, double, double //
%
% output: double, double, cell //
%
% requires: impHedrickLab.m //
%
% see also: 
%
% created with: MATLAB ver. 8.6.0.267246 (R2015b) //
%
% created by: T. Woehrl //
% created on: 2017-03-01 //
%
% modified:
% - on:  by:  to:
%
% disclaimer: Without warranty of any kind. //
%
%------------- BEGIN CODE ---------------
tic

n = length(filepaths);


Xint = nan(tInt,length(xis),n);
Xcut = nan(max(los-tds),length(xis),n);
err = {};
for k = 1:n


    xy0 = [];
    tcut = [];
    xcut = [];
    try
        disp([num2str(k),'/',num2str(n)]);
        xy0 = impHedrickLab(filepaths{k},IDs{k},marker,'txt'); % import file
        tcut = tds(k):los(k);              


        xcut  = xy0(tcut,xis); % cut data
        Xcut(1:length(xcut),xis,k) = xcut;

        Xint(1:tInt,xis,k) = interp1_xn(xcut,tInt);
    catch me
        err(k,1) = IDs(k);
        continue
    end
end
  whos 
  toc
  err

%------------- END OF CODE --------------
