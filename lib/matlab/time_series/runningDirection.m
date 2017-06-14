function [lx,ly,phi,dm]=runningDirection(x,y)
% info: average direction (linear regression method) of moving point
% r(x1,x2,t) //
%
% syntax: [lx,ly,phi,dm]=runningDirection(x,y) //
%
% input: 
% - x: Signal in Laufrichtung 1D-Vektor //
% - y: Signal in horizontaler Richtung 1D-Vektor //
% output: 
% - lx, ly: Lineare Regression //
% - phi: Winkel zwischen x-Achse und (lx,ly) //
% - dm: Drehmatrix
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
% Fit
px=polyfit(1:length(x),x',1);
lx=polyval(px,1:length(x));

py=polyfit(1:length(y),y',1);
ly=polyval(py,1:length(y));


% Winkel zwischen mittlerer Laufrichtung und x-Achse
phi=atan2(ly(end)-ly(1),lx(end)-lx(1));

% Drehmatrix
dm=[cos(phi) -sin(phi); sin(phi) cos(phi)];
end
%------------- END OF CODE --------------
