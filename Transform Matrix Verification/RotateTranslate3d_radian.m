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

function [M] = RotateTranslate3d_radian(m,thx,thy,thz,dx,dy,dz)

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
       %%
%     m = [PositionOfGammaCamearaLU, -P2D 1]'
%     thx = -45
%     thy = 0
%     thz = 0;
%     dx = 0;
%     dy = 0;
%     dz = 0; 
    
    [s_my, s_mx] = size(m);
    M = zeros(s_my,s_mx);
    for nn = 1 : s_my
        Rx = [1 0 0 0 ; 0 cos(thx) -sin(thx) 0; 0 sin(thx) cos(thx) 0; 0 0 0 1];
        Ry = [cos(thy) 0 sin(thy) 0 ; 0 1 0 0; -sin(thy) 0 cos(thy) 0 ; 0 0 0 1];
        Rz = [cos(thz) -sin(thz) 0 0 ; sin(thz) cos(thz) 0 0 ; 0 0 1 0; 0 0 0 1];
        R = Rz*Ry*Rx;
        T = [ 1 0 0 dx ; 0 1 0 dy; 0 0 1 dz; 0 0 0 1];
        %M(nn,:) = (R*(T*m(nn,:)'))';
        M = Rz*Ry*Rx*T*transpose(m);
    end


end