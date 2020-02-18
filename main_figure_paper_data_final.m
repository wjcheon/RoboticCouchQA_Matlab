clc
clear
close all
%%
paper_data = xlsread('paper_data_final.xlsx');
x_axis_diff_vts = paper_data(1:21,7)
x_axis_diff_faro = paper_data(1:21,8)
x_axis_diff = paper_data(1:21,9)
x_axis = paper_data(1:21, 1)
figure, hold on
plot(x_axis, x_axis_diff_vts, 'r--')
plot(x_axis, x_axis_diff_faro, 'b--')
% plot(x_axis, x_axis_diff), 
grid on, ylim([0 0.5])
title('Difference of VTS measruement data with FARO data (x-axis)')
xlabel('[mm]'), ylabel('Difference [mm]')
legend('Difference VTS', 'Difference FARO')

%%
paper_data = xlsread('paper_data_final.xlsx');
x_axis_diff_vts = paper_data(26:46,7)
x_axis_diff_faro = paper_data(26:46,8)
x_axis_diff = paper_data(26:46,9)
x_axis = paper_data(26:46, 2)
figure, hold on
plot(x_axis, x_axis_diff_vts, 'r--')
plot(x_axis, x_axis_diff_faro, 'b--')
% plot(x_axis, x_axis_diff), 
grid on, ylim([0 0.5])
title('Difference of VTS measruement data with FARO data (y-axis)')
xlabel('[mm]'), ylabel('Difference [mm]')
legend('Difference VTS', 'Difference FARO')

%% Z

paper_data = xlsread('paper_data_final.xlsx');
x_axis_diff_vts = paper_data(49:59,7)
x_axis_diff_faro = paper_data(49:59,8)
x_axis_diff = paper_data(49:59,9)
x_axis = paper_data(49:59, 3)
figure, hold on
plot(x_axis, x_axis_diff_vts, 'r--')
plot(x_axis, x_axis_diff_faro, 'b--')
% plot(x_axis, x_axis_diff), 
grid on, ylim([0 0.5])
title('Difference of VTS measruement data with FARO data (z-axis)')
xlabel('[mm]'), ylabel('Difference [mm]')
legend('Difference VTS', 'Difference FARO')

%% Yaw

rotation_steps = [-90	-80	-70	-60	-50	-40	-30	-20	-10	0	10	20	30	40	50	60	70	80	90]
VTS_yaw = [0.071	0.069	0.061	0.058	0.053	0.041	0.034	0.013	-0.015	0.010	0.047	0.091	0.073	0.055	0.037	0.061	0.021	-0.017	-0.035]
Faro_yaw = [0.028	0.024	0.017	0.011	0.003	0.004	-0.003	0.001	0.004	0.000	0.001	0.004	0.008	0.016	0.005	0.011	0.008	-0.004	-0.020]
%
figure, hold on,
plot(rotation_steps, VTS_yaw, 'r--')
plot(rotation_steps, Faro_yaw, 'b--')
% plot(x_axis, x_axis_diff), 
grid on, ylim([-0.2 0.2])
title('Difference of VTS measruement data with FARO data (yaw)')
xlabel('[mm]'), ylabel('Difference [mm]')
legend('Difference VTS', 'Difference FARO')

%%
roll_steps = [ -3	-2	-1	0	1	2	3]
VTS_roll = [0.04	0.02	0.03	0.02	0.08	-0.01	0.03]

figure, hold on,
plot(roll_steps, VTS_roll, 'r--')
% plot(x_axis, x_axis_diff), 
grid on, ylim([-0.2 0.2])
title('Difference of VTS measruement data (roll)')
xlabel('[mm]'), ylabel('Difference [mm]')
legend('Difference VTS', 'Difference FARO')

%%
pitch_steps = [-5	-4	-3	-2	-1	0	1	2	3	4	5];
pitch_roll = [-0.02	0.04	0.02	-0.04	0.03	0.02	0.04	0.03	0.02	0.06	0.04];

figure, hold on,
plot(pitch_steps, pitch_roll, 'r--')
% plot(x_axis, x_axis_diff), 
grid on, ylim([-0.2 0.2])
title('Difference of VTS measruement data (pitch)')
xlabel('[mm]'), ylabel('Difference [mm]')
legend('Difference VTS', 'Difference FARO')




