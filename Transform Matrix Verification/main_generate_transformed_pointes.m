clc
clear
close all
%%
OriginalPosition = [ 0 0 0 ; 1 0 0; 0 1 0; 1 1 0; 0 0 1; 1 0 1; 0 1 1; 1 1 1]
sz_OriginalPosition  = size(OriginalPosition )
OnePadding = transpose(ones(1,sz_OriginalPosition(1)))
OriginalPosition  = [OriginalPosition OnePadding]

thx = 1
thy = 2
thz = 3
dx = 10
dy = 20
dz = 30
[M] = RotateTranslate3d_radian(OriginalPosition,thx,thy,thz,dx,dy,dz)
%%
thx_sol = -9.04
thy_sol = 0.32
thz_sol = -6.70
dx_sol = -20.60
dy_sol = 4.977
dz_sol = 31.5352
[M2] = RotateTranslate3d_radian(OriginalPosition,thx_sol,thy_sol,thz_sol,dx_sol,dy_sol,dz_sol)