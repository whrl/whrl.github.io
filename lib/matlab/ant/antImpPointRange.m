function [X,err]=antImpPointRange(filepaths, IDs, marker, tis,vor,nach ,xis)
% info: importiere Koordinaten eines Punktes um (zeitlich vor und nach) Messzeitpunkt //
%
% syntax: [X,err]=antImpPointRange(filepaths, IDS, marker, tis, xis) //
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
% created on: 2017-03-15 //
%
% modified:
% - on:  by:  to:
%
% disclaimer: Without warranty of any kind.//
%
%------------- BEGIN CODE ---------------
 tic
 n = length(filepaths);
 ts= vor+nach+1;
 X = nan(n,length(ts),length(xis));
 err = {};
 for k = 1:n

    
     xy0 = []; bereich = [];
     try
              
       %  disp([num2str(k),'/',num2str(n)])
             
         xy0 = impHedrickLab(filepaths{k},IDs{k},marker{k},'txt');
         tk =  tis(k)-vor:tis(k)+nach;
         X(k,1:ts,xis) = xy0(tk,xis); 
             
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
