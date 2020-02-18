clc
clear
close all
opengl('save','software')
%% DataStreaming
%     BufferForSave = load('Reference_data_protonG2')
%     BufferForSave = BufferForSave.BufferForSave;
%     

    BufferForSave = xlsread('Trial06.xlsx');
    %% Calculate distance.
    marker1 = BufferForSave(4:end,1:3);
    marker2 = BufferForSave(4:end,4:6);
    marker3 = BufferForSave(4:end,7:9);
    marker4 = BufferForSave(4:end,10:12);
    
    marker1_mean = mean(marker1,1)
    marker2_mean = mean(marker2,1)
    marker3_mean = mean(marker3,1)
    marker4_mean = mean(marker4,1)
    markers = [marker1_mean;marker4_mean;marker3_mean;marker2_mean]'
    figure(1), scatter3(markers(1,:),markers(2,:),markers(3,:),'o')
    axis equal, hold on;
    
    Dist1to2 = GetDist(marker1_mean,marker2_mean);
    Dist1to3 = GetDist(marker1_mean,marker3_mean);
    Dist1to4 = GetDist(marker1_mean,marker4_mean);
    Dist2to3 = GetDist(marker2_mean,marker3_mean);
    Dist2to4 = GetDist(marker2_mean,marker4_mean);
    Dist3to4 = GetDist(marker3_mean,marker4_mean);
    
    DistData = [Dist1to2;Dist1to3;Dist1to4;Dist2to3;Dist2to4;Dist3to4];
    DistData = sort(DistData);
%     Dist_mean = mean(DistData(1:4));
    Dist_mean = Dist1to3;
    
    %%
    
        GenerPoint = [Dist_mean,0,0;...
        0,0,0;...
        Dist_mean,Dist_mean,0;...
        0,Dist_mean,0]'
    
    figure(1),scatter3(GenerPoint(1,:),GenerPoint(2,:),GenerPoint(3,:))
    axis equal;
    %
    %
    
    
  
%     scatter3(Cube_point(1,5:8),Cube_point(2,5:8),Cube_point(3,5:8))
%     axis equal;
    
    figure(1),subplot (1,2,1), hold on;
    [Cube_point] = GenerateCube(markers);
    DrawCube(Cube_point,1,'o','b');
    axis equal
    %
    %
    maker_upper = Cube_point(:,5:8);
    maker_upper = [maker_upper, maker_upper(:,1)]
    iii = 3
    figure(1), plot3(maker_upper(1,iii), maker_upper(2,iii), maker_upper(3,iii),'ro');
    figure(1), plot3(maker_upper(1,:), maker_upper(2,:), maker_upper(3,:),'bo-');
    grid on, axis equal
    %
    [refer_Cube_point] = GenerateCube(GenerPoint);
    DrawCube(refer_Cube_point,1,'s','r')
    axis equal 
    %%
    
      zlim([-42 142])
     xlim([-30 42])
     ylim([-30 42])

      %% RelationMatrix(pinv)
    Cube_Point_forinv = [Cube_point; ones(1,size(Cube_point,2))]
    refer_Cube_point_forinv = [refer_Cube_point; ones(1,size(refer_Cube_point,2))]
    
    RelationMatrix = refer_Cube_point_forinv*pinv(Cube_Point_forinv)
    

    %%
%     RelationMatrix = load('RelationMatrix');
%     RelationMatrix = RelationMatrix.RelationMatrix;
    for kk = 1 : size(Cube_Point_forinv,2)
        point_transffered(1:4,kk) = RelationMatrix*Cube_Point_forinv(:,kk);
    end 
    
%     
%     figure(1),subplot (1,2,2), hold on;
%     [Cube_point] = GenerateCube(markers);
%     DrawCube(Cube_point,1,'b');
%     
    figure(1),subplot(1,2,2), hold on;
    [refer_Cube_point] = GenerateCube(GenerPoint);
    DrawCube(refer_Cube_point,1,'diamond','g')
    axis equal 
    
    scatter3(point_transffered(1,:),point_transffered(2,:),point_transffered(3,:),'diamond','MarkerFaceColor',[0 1 0]);
    
    
    
    %%
%     
%     A = [0	-10	-20	-30	-40	-50	-60	-70	-80	-90]
%     nu1 = rand(1,10)/10 - 0.05
%     B = A+nu1

 zlim([-42 142])
     xlim([-30 42])
     ylim([-30 42])
