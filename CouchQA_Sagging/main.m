clc
clear
close all
%%

XaxisData = xlsread('Xaxis.xlsx');
YaxisData = xlsread('Yaxis.xlsx');
ZaxisData = xlsread('Zaxis.xlsx');


%%
TargetAxisData=ZaxisData;
ReferenceCoordinates_X_x = TargetAxisData(:,1);
ReferenceCoordinates_X_y = TargetAxisData(:,2);
ReferenceCoordinates_X_z = TargetAxisData(:,3);

MeasuredCoordinates_X_x = TargetAxisData(:,4);
MeasuredCoordinates_X_y = TargetAxisData(:,5);
MeasuredCoordinates_X_z = TargetAxisData(:,6);

%%

% TLS Line
% (X-P(1))/N(1) = (Y-P(2))/N(2) = (Z-P(3))/N(3)
% P is a point on the fitted line
% and N its direction vector.

% test data
x=ReferenceCoordinates_X_x;
y=ReferenceCoordinates_X_y;
z=ReferenceCoordinates_X_z;
n = size(ReferenceCoordinates_X_x,1);

% line fit
P=[mean(x),mean(y),mean(z)]';
[U,S,V]=svd([x-P(1),y-P(2),z-P(3)]);
N=1/V(end,1)*V(:,1);

figure(1)
% plot3(x,y,z,'bo')
hold on
% plot3(P(1),P(2),P(3),'ro')
A=P+dot([x(1),y(1),z(1)]'-P,N)*N/norm(N)^2;
B=P+dot([x(n),y(n),z(n)]'-P,N)*N/norm(N)^2;
plot3([A(1),B(1)],[A(2),B(2)],[A(3),B(3)])
grid; hold off
ReferenceVector = [ReferenceCoordinates_X_x(n),ReferenceCoordinates_X_y(n),ReferenceCoordinates_X_z(n)];


%%


% TLS Line
% (X-P(1))/N(1) = (Y-P(2))/N(2) = (Z-P(3))/N(3)
% P is a point on the fitted line
% and N its direction vector.

% test data
x_measured=MeasuredCoordinates_X_x;
y_measured=MeasuredCoordinates_X_y;
z_measured=MeasuredCoordinates_X_z;
n_measured = size(MeasuredCoordinates_X_x,1);

% line fit
P_measured=[mean(x_measured),mean(y_measured),mean(z_measured)]';
[U_measured,S_measured,V_measured]=svd([x_measured-P_measured(1),y_measured-P_measured(2),z_measured-P_measured(3)]);
N_measured=1/V_measured(end,1)*V_measured(:,1);

figure(1)
% plot3(x_measured,y_measured,z_measured,'ro')
hold on
% plot3(P_measured(1),P_measured(2),P_measured(3),'ro')
A_measured=P_measured+dot([x_measured(1),y_measured(1),z_measured(1)]'-P_measured,N_measured)*N_measured/norm(N_measured)^2;
B_measured=P_measured+dot([x_measured(n),y_measured(n),z_measured(n)]'-P_measured,N_measured)*N_measured/norm(N_measured)^2;
plot3([A_measured(1),B_measured(1)],[A_measured(2),B_measured(2)],[A_measured(3),B_measured(3)],'r--')
grid; hold off
MeasuredVector =  B_measured - A_measured;


%%
 degree = CalRotationDegree(ReferenceVector,MeasuredVector)
 
 
