clc
clear
close all

%%

    RelationMatrix = load('RelationMatrix_0404_2.mat')
    RelationMatrix = RelationMatrix.RelationMatrix; 
    inv_RelationMatrix = pinv(RelationMatrix)
    
    %% Load the file
    ExportDistanceReport_0404_x_2 = xlsread('ExportDistanceReport_0404_x_2.xls');
    RoomCoordinates = ExportDistanceReport_0404_x_2(:,1:3);
    MeasuredCoordinates = ExportDistanceReport_0404_x_2(:,4:6);
    RoomCoordinatesForInv = [RoomCoordinates' ;ones(1,size(RoomCoordinates,1))]
    MeasuredCoordinatesForInv = [MeasuredCoordinates' ; ones(1,size(MeasuredCoordinates,1))]
    
    for ii = 1: size(RoomCoordinatesForInv,2)
        ViconReconCoordinates(1:4,ii) = inv_RelationMatrix*RoomCoordinatesForInv(:,ii)
    
    end
    
    
    %% Load the file
    ExportDistanceReport_0404_y_2 = xlsread('ExportDistanceReport_0404_y_2.xls');
    RoomCoordinates = ExportDistanceReport_0404_y_2(:,1:3);
    MeasuredCoordinates = ExportDistanceReport_0404_y_2(:,4:6);
    RoomCoordinatesForInv = [RoomCoordinates' ;ones(1,size(RoomCoordinates,1))]
    MeasuredCoordinatesForInv = [MeasuredCoordinates' ; ones(1,size(MeasuredCoordinates,1))]
    
    for ii = 1: size(RoomCoordinatesForInv,2)
        ViconReconCoordinates(1:4,ii) = inv_RelationMatrix*RoomCoordinatesForInv(:,ii)
    
    end