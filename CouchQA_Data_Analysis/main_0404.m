clc
clear
close all
%% Add path. 
    addpath('0404')

%% Data read
    QAData_0404_x = xlsread('ExportDistanceReport_0404_x.xls');
    QAData_0404_y = xlsread('ExportDistanceReport_0404_y.xls');
    QAData_0404_x_2 = xlsread('ExportDistanceReport_0404_x_2.xls');
    QAData_0404_y_2 = xlsread('ExportDistanceReport_0404_y_2.xls');
    
    Reference_data_0404 = load('Reference_data_protonG2_150404.mat');
    Reference_data_0404 = Reference_data_0404.BufferForSave;
    %%
    marker1_0404 = Reference_data_0404(3:end,1:3);
    marker2_0404 = Reference_data_0404(3:end,4:6);
    marker3_0404 = Reference_data_0404(3:end,7:9);
    marker4_0404 = Reference_data_0404(3:end,10:12);
    
    marker1_0404_mean = mean(marker1_0404,1);
    marker2_0404_mean = mean(marker2_0404,1);
    marker3_0404_mean = mean(marker3_0404,1);
    marker4_0404_mean = mean(marker4_0404,1);
    
    figure, hold on,
    scatter3(marker1_0404_mean(1),marker1_0404_mean(2),marker1_0404_mean(3))
    scatter3(marker2_0404_mean(1),marker2_0404_mean(2),marker2_0404_mean(3))
    scatter3(marker3_0404_mean(1),marker3_0404_mean(2),marker3_0404_mean(3))
    scatter3(marker4_0404_mean(1),marker4_0404_mean(2),marker4_0404_mean(3))
    grid on, axis equal, view(3)
    %%
    vector_marker_bw_1to2 = marker2_0404_mean -marker1_0404_mean;
    vector_marker_bw_1to3 = marker3_0404_mean -marker1_0404_mean;
    norm_12 = norm( vector_marker_bw_1to2 );
    norm_13 = norm( vector_marker_bw_1to3 );
    cross_data(1,1:3) = cross(vector_marker_bw_1to2/norm_12 ,vector_marker_bw_1to3/norm_13)
    
    %%
    vector_marker_bw_2to1 = marker1_0404_mean -marker2_0404_mean;
    vector_marker_bw_2to4 = marker4_0404_mean -marker2_0404_mean;
    norm_21 = norm( vector_marker_bw_2to1 )
    norm_24 = norm( vector_marker_bw_2to4 )
    cross_data(2,1:3) = cross(vector_marker_bw_2to1/norm_21 ,vector_marker_bw_2to4/norm_24)
    
    %%
    vector_marker_bw_4to2 = marker2_0404_mean -marker4_0404_mean;
    vector_marker_bw_4to3 = marker3_0404_mean -marker4_0404_mean;
    norm_42 = norm( vector_marker_bw_4to2 )
    norm_43 = norm( vector_marker_bw_4to3 )
    cross_data(3,1:3) = cross(vector_marker_bw_4to2/norm_42 ,vector_marker_bw_4to3/norm_43)
    
    %%
    vector_marker_bw_3to4 = marker4_0404_mean -marker3_0404_mean;
    vector_marker_bw_3to1 = marker1_0404_mean -marker3_0404_mean;
    norm_34 = norm( vector_marker_bw_3to4 )
    norm_31 = norm( vector_marker_bw_3to1 )
    cross_data(4,1:3) = cross(vector_marker_bw_3to4/norm_34 ,vector_marker_bw_3to1/norm_31)
    
    
    
    %%
    transferred_data = load('transferred_data')
    transferred_data =transferred_data.point_transffered;
    for ii = 1: size(transferred_data ,2)
        norm_vector = norm(transferred_data(1:3,ii))
        transferred_data_norm(1:4,ii) = transferred_data(:,ii)./norm_vector
        
    end
    
    %%
    
    XAxisData_x = QAData_0404_x(:,1);
    XAxisData_y = QAData_0404_x(:,2);
    XAxisData_z = QAData_0404_x(:,3);
    
    XAxisData_x_measured = QAData_0404_x(:,4);
    XAxisData_y_measured = QAData_0404_x(:,5);
    XAxisData_z_measured = QAData_0404_x(:,6);
    
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
    
    YAxisData_x = QAData_0404_y(:,1);
    YAxisData_y = QAData_0404_y(:,2);
    YAxisData_z = QAData_0404_y(:,3);
    
    YAxisData_x_measured = QAData_0404_y(:,4);
    YAxisData_y_measured = QAData_0404_y(:,5);
    YAxisData_z_measured = QAData_0404_y(:,6);
    
    linefit_X = fitlm(YAxisData_y,YAxisData_y_measured);
    linefit_X.Rsquared
    figure(1);
    plot(YAxisData_y,YAxisData_y_measured,'*b')
    grid on; axis equal;
    figure(2), plot(YAxisData_y_measured,YAxisData_z_measured)
    xlabel('Robotic couch Dimension : X [mm]')
    ylabel('Robotic couch Dimension : Z [mm]')
    grid on; 
 
        %%
    
    XAxisData_x = QAData_0404_x_2(:,1);
    XAxisData_y = QAData_0404_x_2(:,2);
    XAxisData_z = QAData_0404_x_2(:,3);
    
    XAxisData_x_measured = QAData_0404_x_2(:,4);
    XAxisData_y_measured = QAData_0404_x_2(:,5);
    XAxisData_z_measured = QAData_0404_x_2(:,6);
    
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
    
    YAxisData_x = QAData_0404_y_2(:,1);
    YAxisData_y = QAData_0404_y_2(:,2);
    YAxisData_z = QAData_0404_y_2(:,3);
    
    YAxisData_x_measured = QAData_0404_y_2(:,4);
    YAxisData_y_measured = QAData_0404_y_2(:,5);
    YAxisData_z_measured = QAData_0404_y_2(:,6);
    
    linefit_X = fitlm(YAxisData_y,YAxisData_y_measured);
    linefit_X.Rsquared
    figure(1);
    plot(YAxisData_y,YAxisData_y_measured,'*b')
    grid on; axis equal;
    figure(2), plot(YAxisData_y_measured,YAxisData_z_measured)
    xlabel('Robotic couch Dimension : X [mm]')
    ylabel('Robotic couch Dimension : Z [mm]')
    grid on; 
 
    
    
    
    
    
    
    
    
    
    