clc
clear
close all
%%
    addpath('0410')

%%
    ReferenceData = load('Reference_data_protonG2_150410_2')
    BufferForSave= ReferenceData.BufferForSave
    
    
    marker1 = BufferForSave(4:end,1:3);
    marker2 = BufferForSave(4:end,4:6);
    marker3 = BufferForSave(4:end,7:9);
    marker4 = BufferForSave(4:end,10:12);
    
    marker1_mean = mean(marker1,1);
    marker2_mean = mean(marker2,1);
    marker3_mean = mean(marker3,1);
    marker4_mean = mean(marker4,1);
    markers = [marker1_mean;marker2_mean;marker3_mean;marker4_mean]'
    figure(1), scatter3(markers(1,:),markers(2,:),markers(3,:))
    axis equal, hold on;
    
    Dist1to2 = GetDist(marker1_mean,marker2_mean);
    Dist1to3 = GetDist(marker1_mean,marker3_mean);
    Dist1to4 = GetDist(marker1_mean,marker4_mean);
    Dist2to3 = GetDist(marker2_mean,marker3_mean);
    Dist2to4 = GetDist(marker2_mean,marker4_mean);
    Dist3to4 = GetDist(marker3_mean,marker4_mean);
    
    DistData = [Dist1to2;Dist1to3;Dist1to4;Dist2to3;Dist2to4;Dist3to4];
    DistData = sort(DistData);
    Dist_mean = mean(DistData(1:4));
    
      
    GenerPoint_Reference = Dist_mean/2
    GenerPoint = [0,0,0;...
        0,Dist_mean,0;...
        Dist_mean,0,0;...
        Dist_mean,Dist_mean,0]'
    figure(1),scatter3(GenerPoint(1,:),GenerPoint(2,:),GenerPoint(3,:))
    axis equal;
      
    
    
    figure(1),hold on;
    [Cube_point] = GenerateCube(markers);
    DrawCube(Cube_point,1,'b');
    
    
    [refer_Cube_point] = GenerateCube(GenerPoint);
    DrawCube(refer_Cube_point,1,'r')
    axis equal 
    
    
        %% RelationMatrix(pinv)
    Cube_Point_forinv = [Cube_point; ones(1,size(Cube_point,2))]
    refer_Cube_point_forinv = [refer_Cube_point; ones(1,size(refer_Cube_point,2))]
    
    RelationMatrix = refer_Cube_point_forinv*pinv(Cube_Point_forinv)
    
    for kk = 1 : size(Cube_Point_forinv,2)
        point_transffered(1:4,kk) = RelationMatrix*Cube_Point_forinv(:,kk);
    end
    figure(1),hold on;
    scatter3(point_transffered(1,:),point_transffered(2,:),point_transffered(3,:),'g');
%    save('RelationMatrix_0404_2',RelationMatrix)
    
     %%
%     
%     
%     
%     
%     
    
    %%
        distance = -250;
        vector_x_measured = (Cube_Point_forinv(1:3,3) - Cube_Point_forinv(1:3,1))./...
            norm(Cube_Point_forinv(1:3,3) - Cube_Point_forinv(1:3,1));
        vector_x_measured_scaled = Cube_Point_forinv(1:3,1)+(vector_x_measured *distance );
        
        RelationMatrix*[vector_x_measured_scaled;1]
    
    %%
        distanceY = -500;
        vector_y_measured = (Cube_Point_forinv(1:3,2) - Cube_Point_forinv(1:3,1))./...
            norm(Cube_Point_forinv(1:3,2) - Cube_Point_forinv(1:3,1))
        vector_y_measured_scaled = Cube_Point_forinv(1:3,1)+vector_y_measured *distanceY;
        
        RelationMatrix*[vector_y_measured_scaled;1]
        
        %%
        distanceZ = -360;
        vector_z_measured = (Cube_Point_forinv(1:3,1) - Cube_Point_forinv(1:3,5))./...
            norm(Cube_Point_forinv(1:3,1) - Cube_Point_forinv(1:3,5))
        vector_z_measured_scaled = Cube_Point_forinv(1:3,1)+vector_z_measured *distanceZ;
        
        RelationMatrix*[vector_z_measured_scaled;1]
        
        
        
        
        
    