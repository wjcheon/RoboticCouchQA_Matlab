clc
clear
close all
%% DataStreaming
%     ViconRealTimeSDK_WJ;
%     save('Reference_data','BufferForSave');
addpath('ReferenceData')
BufferForSave = load('Reference_data.mat')
BufferForSave = BufferForSave.BufferForSave;
%
%% Calculate distance.
marker1 = BufferForSave(4:end,1:3);
marker2 = BufferForSave(4:end,4:6);
marker3 = BufferForSave(4:end,7:9);
marker4 = BufferForSave(4:end,10:12);

marker1_mean = mean(marker1,1)
marker2_mean = mean(marker2,1)
marker3_mean = mean(marker3,1)
marker4_mean = mean(marker4,1)
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


%% switch.
figure(100), hold on;
view(3),grid on;
for hh = 1 : size(Cube_point,2)
    scatter3(Cube_point(1,hh),Cube_point(2,hh),Cube_point(3,hh))
    scatter3(refer_Cube_point(1,hh),refer_Cube_point(2,hh),refer_Cube_point(3,hh))
    pause(3)
end

%% RelationMatrix(pinv)
Cube_Point_forinv = [Cube_point; ones(1,size(Cube_point,2))]
refer_Cube_point_forinv = [refer_Cube_point; ones(1,size(refer_Cube_point,2))]

RelationMatrix = refer_Cube_point_forinv*pinv(Cube_Point_forinv)

%%

for kk = 1 : size(Cube_Point_forinv,2)
    point_transffered(1:4,kk) = RelationMatrix*Cube_Point_forinv(:,kk);
end
figure(1),hold on;
scatter3(point_transffered(1,:),point_transffered(2,:),point_transffered(3,:),'g');




%%
%      ViconRealTimeSDK_WJ;
BufferForSave = load('Motion_data.mat')
BufferForSave = BufferForSave.BufferForSave;


%%
MotionData = BufferForSave;
save('Motion_data.mat','BufferForSave')

Motion_marker1 = MotionData(4:end,1:3);
Motion_marker2 = MotionData(4:end,4:6);
Motion_marker3 = MotionData(4:end,7:9);
Motion_marker4 = MotionData(4:end,10:12);


Motion_marker_data = Motion_marker3';
Motion_marker_data = [Motion_marker_data;ones(1,size(Motion_marker_data,2))]

figure(3),hold on;view(3);
scatter3(Motion_marker_data(1,:),Motion_marker_data(2,:),Motion_marker_data(3,:));
axis equal; grid on;
%%
for ii = 1 : size(Motion_marker_data,2)
    Motion_marker1_transffered(1:4,ii) = RelationMatrix*Motion_marker_data(:,ii);
end
figure(3),
scatter3(Motion_marker1_transffered(1,:),Motion_marker1_transffered(2,:),Motion_marker1_transffered(3,:),'r')
axis equal; grid on;

%% plotting

for tt = 1 : size(Motion_marker1_transffered,2)
    diff_dist(tt) =  dist3d(Motion_marker1_transffered(1:3,1),Motion_marker1_transffered(1:3,tt));
end
figure(4)
[pks,locs] = findpeaks(diff_dist)
plot(diff_dist)
pks_max = max(pks)
[max_r,max_c] = find(diff_dist == pks_max)
pks_min = min(pks)
[min_r,min_c] = find(diff_dist == pks_min)

motion_distance = abs(pks_max) + abs(pks_min)

%%

stdv_x = std(Motion_marker1_transffered(1,:))
stdv_y = std(Motion_marker1_transffered(2,:))
stdv_z = std(Motion_marker1_transffered(3,:))


stdv_x_motion = std(Motion_marker_data(1,:))
stdv_y_motion = std(Motion_marker_data(2,:))
stdv_z_motion = std(Motion_marker_data(3,:))

distance_motion = dist3d(Motion_marker1_transffered(1:3,max_c),Motion_marker1_transffered(1:3,min_c))


%%

curve_fitted_data = Motion_marker1_transffered(2,:)
axisData = [1: size(Motion_marker1_transffered,2)]
[fitresult, gof] = createFit1(axisData, curve_fitted_data);
for ii = 1 : size(Motion_marker1_transffered,2)
    FitResultData(ii) = fitresult.a0 + ...
        fitresult.a1*cos(ii*fitresult.w)+...
        fitresult.b1*sin(ii*fitresult.w)+...
        fitresult.a2*cos(2*ii*fitresult.w)+...
        fitresult.b2*sin(2*ii*fitresult.w)+...
        fitresult.a3*cos(3*ii*fitresult.w)+...
        fitresult.b3*sin(3*ii*fitresult.w);
end


figure(8), hold on
plot(axisData,FitResultData)
[pks,locs] = findpeaks(FitResultData)
plot(locs,pks,'or')

SelectedData =  FitResultData(locs(1) :locs(2));
SD_min = min(SelectedData)
SD_max = max(SelectedData)

SelectedDataRefer =  FitResultData(locs(1) :locs(2));
SD_Refer_min = min(SelectedDataRefer)
SD_Refer_max = max(SelectedDataRefer)


[min_r, min_c] = find(SD_min == SelectedData)
[max_r, max_c] = find(SD_max == SelectedData)

SelectedDataForNormalize = SelectedData(min_c : max_c)
SelectedDataReferForNormalize = SelectedDataRefer(min_c : max_c)

figure(9)
LinearFitAxisData = [ 1: size(SelectedDataForNormalize,2)]
plot(LinearFitAxisData,SelectedDataForNormalize)

figure(10)
plot(SelectedDataForNormalize,SelectedDataReferForNormalize)
grid on;

























