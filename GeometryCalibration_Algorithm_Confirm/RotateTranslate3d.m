% 
% input   
% unit = degree
% thx = unclock wise, rotation degree of X axis.
% thy = unclock wise, rotation degree of Y axis.
% thz = unclock wise, rotation degree of Z axis.
% m = input Points
% n X 4
% 
% output 
% M = Rotated Points.
% n X 4
% 

function [M] = RotateTranslate3d(m,thx,thy,thz,dx,dy,dz)

    if nargin==1
        thx=0;
        thy=0;
        thz=0;
        dx=0;
        dy=0;
        dz=0;
    elseif nargin==2
        thy=0;
        thz=0;
        dx=0;
        dy=0;
        dz=0;
    elseif nargin==3
        thz=0;
        dx=0;
        dy=0;
        dz=0;
    
    elseif nargin==3
        thz=0;
        dx=0;
        dy=0;
        dz=0;
        
    elseif nargin==4
        dx=0;
        dy=0;
        dz=0;
        
    elseif nargin==5
        dy=0;
        dz=0;
        
    elseif nargin==6
        dz=0;
    end
    
    [s_my, s_mx] = size(m);
    M = zeros(s_my,s_mx);
    for nn = 1 : s_my
        Rx = [1 0 0 0 ; 0 cosd(thx) -sind(thx) 0; 0 sind(thx) cosd(thx) 0; 0 0 0 1];
        Ry = [cosd(thy) 0 sind(thy) 0 ; 0 1 0 0; -sind(thy) 0 cosd(thy) 0 ; 0 0 0 1];
        Rz = [cosd(thz) -sind(thz) 0 0 ; sind(thz) cosd(thz) 0 0 ; 0 0 1 0; 0 0 0 1];
        R = Rz*Ry*Rx;
        T = [ 1 0 0 dx ; 0 1 0 dy; 0 0 1 dz; 0 0 0 1];
        M(nn,:) = (R*(T*m(nn,:)'))';
    end


end