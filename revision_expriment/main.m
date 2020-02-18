clc
clear
close all
%%
dataSet = xlsread('Trial03.csv');
Markers.marker1 = dataSet(5:end,3:5);
Markers.marker2 = dataSet(5:end,6:8);
Markers.marker3 = dataSet(5:end,9:11);
Markers.marker4 = dataSet(5:end,12:14);
%
reference_pos = Markers.marker1(1,:);
for iter1 = 1: size(dataSet,1)-5
    dist_measure(iter1) = GetDist(reference_pos, Markers.marker1(iter1,:));
end
%%
%
step_size = 40;
steps = 21;
for iter2 = 1: steps 
    TargetAmplitude(iter2) = (iter2-1)*step_size;
end
%%
%
for iter4 = 1: size(TargetAmplitude,2)
        [M(iter4),I(iter4)] = min(abs(dist_measure - ones(1,size(dist_measure,2))*TargetAmplitude(iter4)));
        measured_value(iter4) = dist_measure(I(iter4));
end

%%
ResultDataSet = xlsread('result_summary.xlsx');
XaxisData = ResultDataSet(15,:);
YaxisData = ResultDataSet(16,:);
ZaxisData = ResultDataSet(17,:);
%
%%
step_size = 25;
steps = 21;
for iter2 = 1: steps 
    x_axis(iter2) = (iter2-1)*step_size;
end
x_axis = x_axis - 250 
%%
step_size = 50;
steps = 21;
for iter2 = 1: steps 
    y_axis(iter2) = (iter2-1)*step_size;
end
y_axis = y_axis - 500

%%
step_size = 40;
steps = 11;
for iter2 = 1: steps 
    z_axis(iter2) = (iter2-1)*step_size;
end
z_axis = z_axis - 300

%%
figure(1),
plot(x_axis, XaxisData-x_axis, 'ro'), hold on
plot(y_axis, YaxisData-y_axis, 'bo'), 
plot(z_axis, ZaxisData(1:11)-z_axis, 'go'),
hold off
grid on
legend('Discrepancy in X axis','Discrepancy in Y axis','Discrepancy in Z axis')
title('6D robotic couch QA report')


%%