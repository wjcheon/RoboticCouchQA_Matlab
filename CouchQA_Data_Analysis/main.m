clc
clear
close all
%%
XAxisData = xlsread('ExportDistanceReport_paper_x.xls');
YAxisData = xlsread('ExportDistanceReport_paper_y.xls');
ZAxisData = xlsread('ExportDistanceReport_paper_z.xls');
%%

XAxisData_x = XAxisData(:,1);
XAxisData_y = XAxisData(:,2);
XAxisData_z = XAxisData(:,3);

XAxisData_x_measured = XAxisData(:,4);
XAxisData_y_measured = XAxisData(:,5);
XAxisData_z_measured = XAxisData(:,6);

linefit_X = fitlm(XAxisData_x,XAxisData_x_measured);
linefit_X.Rsquared
figure(1);
plot(XAxisData_x,XAxisData_x_measured,'*b')
grid on; axis equal;
figure(2), plot(XAxisData_x_measured,XAxisData_z_measured)
xlabel('Robotic couch Dimension : X [mm]')
ylabel('Robotic couch Dimension : Z [mm]')
grid on;
%%

YAxisData_x = YAxisData(:,1);
YAxisData_y = YAxisData(:,2);
YAxisData_z = YAxisData(:,3);

YAxisData_x_measured = YAxisData(:,4);
YAxisData_y_measured = YAxisData(:,5);
YAxisData_z_measured = YAxisData(:,6);

linefit_Y = fitlm(YAxisData_y,YAxisData_y_measured);
linefit_Y.Rsquared

figure(3);
plot(YAxisData_y,YAxisData_y_measured,'*b')
grid on; axis equal

figure, plot(YAxisData_y_measured,YAxisData_z_measured)
xlabel('Robotic couch Dimension : Y [mm]')
ylabel('Robotic couch Dimension : Z [mm]')
grid on
%%

ZAxisData_x = ZAxisData(:,1);
ZAxisData_y = ZAxisData(:,2);
ZAxisData_z = ZAxisData(:,3);

ZAxisData_x_measured = ZAxisData(:,4);
ZAxisData_y_measured = ZAxisData(:,5);
ZAxisData_z_measured = ZAxisData(:,6);

linefit_Z = fitlm(ZAxisData_z,ZAxisData_z_measured);
linefit_Z.Rsquared

figure;
plot(ZAxisData_z,ZAxisData_z_measured,'*b')
grid on; axis equal



