clc
clear all
close all
%%
DataSliding = load('EXP_DATA_EtGatingPhantom_Sliding2.mat')
DataUpdown = load('EXP_Data_EtGatingPhantom_Updown2.mat')
DataSliding = DataSliding.BufferForSave;
DataUpdown =DataUpdown.BufferForSave;
%%
SlidingMarker1 = DataSliding(4:end,1:3);
SlidingMarker2 = squeeze(DataSliding(4:end,4:6));
SlidingMarker3 = squeeze(DataSliding(132:end,7:9));
SlidingMarker4 = squeeze(DataSliding(4:end,10:12));

SlidingMarker1_min = min(SlidingMarker1);
SlidingMarker1_max = max(SlidingMarker1);
SlidingMarker2_min = min(SlidingMarker2);
SlidingMarker2_max = max(SlidingMarker2);
SlidingMarker3_min = min(SlidingMarker3);
SlidingMarker3_max = max(SlidingMarker3);
SlidingMarker4_min = min(SlidingMarker4);
SlidingMarker4_max = max(SlidingMarker4);

SlidingDist1 = getdist(SlidingMarker1_min,SlidingMarker1_max)
SlidingDist2 = getdist(SlidingMarker2_min,SlidingMarker2_max)
SlidingDist3 = getdist(SlidingMarker3_min,SlidingMarker3_max)
SlidingDist4 = getdist(SlidingMarker4_min,SlidingMarker4_max)

%% Sliding & Updown
close all
for ii = 1 : 3000
    DistMarker3(ii)  = getdist(SlidingMarker3(1,:),SlidingMarker3(ii,:));
end

[pks, locs] = findpeaks(DistMarker3,'MinPeakProminence', 0.8);

figure(1), subplot(2,1,1), hold on, 
plot(DistMarker3)
ylim([0 21]), xlim([0 3000])
plot(locs, pks, 'b*')
ylabel('Amplitude [mm]')
xlabel('1/framerate [sec]')
title('SuperiorInferior (SI)')
%%

UpdownMarker1 = squeeze(DataUpdown(4:end,1:3));
UpdownMarker2 = squeeze(DataUpdown(4:end,4:6));
UpdownMarker3 = squeeze(DataUpdown(52:end,7:9));
UpdownMarker4 = squeeze(DataUpdown(4:end,10:12));

UpdownMarker1_min = min(UpdownMarker1);
UpdownMarker1_max = max(UpdownMarker1);
UpdownMarker2_min = min(UpdownMarker2);
UpdownMarker2_max = max(UpdownMarker2);
UpdownMarker3_min = min(UpdownMarker3);
UpdownMarker3_max = max(UpdownMarker3);
UpdownMarker4_min = min(UpdownMarker4);
UpdownMarker4_max = max(UpdownMarker4);

UpdownDist1 = getdist(UpdownMarker1_min,UpdownMarker1_max)
UpdownDist2 = getdist(UpdownMarker2_min,UpdownMarker2_max)
UpdownDist3 = getdist(UpdownMarker3_min,UpdownMarker3_max)
UpdownDist4 = getdist(UpdownMarker4_min,UpdownMarker4_max)
%%
for ii = 1 : size(UpdownMarker3,1)
    DistMarker3_Updown(ii)  = getdist(UpdownMarker3(1,:),UpdownMarker3(ii,:));
end
[pks_ud, locs_ud] = findpeaks(DistMarker3_Updown,'MinPeakProminence', 0.8);

%     figure(2)
%     plot(DistMarker3_Updown)
figure(1), subplot(2,1,2), hold on, 
plot(DistMarker3_Updown,'r')
xlim([0 3000]), ylim([0 21])
plot(locs_ud, pks_ud, 'r*')
ylabel('Amplitude [mm]')
xlabel('1/framerate [sec]')
title('Lateral (Lat)')
%%
