clc
clear
close all
%%
ResultData = xlsread('result_summary.xlsx');

axis_data = ResultData(21,:);
measurement_data = ResultData(31,:);

figure, plot(axis_data, measurement_data, 'b*--')
ylim([0, 0.5])
grid on
title('6-D robotic couch QA (y-axis)')
xlabel('Target positoin of y-axis [mm]')
ylabel('Discrepancy b.w. target and measurement [mm]')
