function [X,err]=antImpPointAtFrame(filepaths, IDs, marker, tis, xis)
% info: importiere Koordinaten eines Punktes zu bestimmten Messzeitpunkt //
%
% syntax: [X,err]=antImpPointAtFrame(filepaths, IDS, marker, tis, xis) //
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
% created on: 2017-03-05 //
%
% modified:
% - on:  by:  to:
%
% disclaimer: Without warranty of any kind.//
%
%------------- BEGIN CODE ---------------
 tic
 n = length(filepaths);
 X = nan(n,length(xis));
 err = {};
 for k = 1:n

     
     xy0 = []; 
     try
              
         disp([num2str(k),'/',num2str(n)])
             
         xy0 = impHedrickLab(filepaths{k},IDs{k},marker,'txt');
                 
         X(k,xis) = xy0(tis(k),xis); 
             
     catch me
         err{k,1} = IDs(k);
         continue
     end

 end
 whos 
 toc
 err
end
%------------- END OF CODE --------------
