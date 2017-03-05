function gridManual(steps,style)
% info: plot grid with different spacings //
%
% syntax: gridManual(steps,style) //
%
% input: double, double //
%
% output: plot //
%
% example: gridManual([-20:5:20],{'Linestyle',':','Color',[1 1 1]*.5}) //
%
% requires: //
%
% see also: //
%
% created with: MATLAB ver. 8.6.0.267246 (R2015b) //
% created by: T. Woehrl //
% created on: 2015-07-31 //
%
% modified:
% - on:  by:  to:
%
% disclaimer: Without warranty of any kind. //
%
%------------- BEGIN CODE ---------------
grid_n = length(steps);

lines1 = [steps;steps];

lines2 = ones(2,grid_n);
lines2(1,1:grid_n) = ones(1,grid_n).*steps(1);
lines2(2,1:grid_n) = ones(1,grid_n).*steps(end);

plot(lines1,lines2,style{:}); hold on
plot(lines2,lines1,style{:})
end
%------------- END OF CODE --------------
