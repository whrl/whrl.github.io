function [X,err]=antImpPointRangeRot(filepaths, filenames, marker, tis ,side,t1,t2)
% info: importiere Koordinaten eines Punktes um (zeitlich vor und nach) Messzeitpunkt und rotiere Koordinaten um mittlere Laufrichtung//
%
% syntax: [X,err]=antImpPointRangeRot() //
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
[tm,tn] = size(tis);
X = nan(n,tn,2);

err = {};
errn = 1;
for k = 1:n
    clear cut curRD
    cutRD = [t1(k):t2(k)];
    cut = tis(k,:); % Frames zur Bestimmung der mittleren Laufrichtung
    xy0 = []; bereich = [];
    try
          
        disp([num2str(k),'/',num2str(n)])
        clear lx ly phi dm b3 xy0rot x0 z0
         
         % bestimme mittlere Laufrichtung
        b3 = impHedrickLab(filepaths{k},filenames{k},'b3','txt'); % petiolus
        [lx,ly,phi,dm] = runningDirection(b3(cutRD,1),b3(cutRD,2));
        
        % importiere Marker
        xy0 = impHedrickLab(filepaths{k},filenames{k},marker{k},'txt')-b3;
        
        % rotiere um mittlere Laufrichtung
        % X
        xy0rot(:,1) = cos(-phi) .* xy0(:,1) - sin(-phi) .* xy0(:,2);
        
        if marker{k}(end) == 'z'
            % rotiere Z NICHT
            xy0rot(:,2) = xy0(:,2);
        else
            % rotiere Y
            xy0rot(:,2) = sin(-phi) .* xy0(:,1) + cos(-phi) .* xy0(:,2);
        end
        
        %%% Gleichrichten --> Normierung auf linke Beine
        
        if side{k} == 'R'
            if marker{k}(end) == 'z'
                xy0rot(:,2) = xy0rot(:,2); % Spiegel z NICHT
            else
                xy0rot(:,2) = - xy0rot(:,2);
            end
        end
        for kk = 1:tn
            X(k,kk,1:2) = xy0rot(cut(kk),1:2);
        end
    catch me 
        err{errn,1} = filenames(k);
        errn = errn + 1;
        continue
    end
    
end
whos
toc
err
%------------- END OF CODE --------------
