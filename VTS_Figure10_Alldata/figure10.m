    clc
    clear
    close all

    %%

    Data = xlsread('figure10.xlsx');

    XaxisX = Data(:,1);
    XaxisY= Data(:,2);
    XaxisZ = Data(:,3);

    XdataX = Data(:,4);
    XdataY = Data(:,5);
    XdataZ = Data(:,6);

    %%%%%%%%%%%%%%%%%
    YaxisX = Data(:,8);
    YaxisY= Data(:,9);
    YaxisZ = Data(:,10);

    YdataX = Data(:,11);
    YdataY = Data(:,12);
    YdataZ = Data(:,13);

%%%%%%%%%%%%%%%%%%
    ZaxisX = Data(:,15);
    ZaxisY= Data(:,16);
    ZaxisZ = Data(:,17);

    ZdataX = Data(:,18);
    ZdataY = Data(:,19);
    ZdataZ = Data(:,20);

    %%
    figure(1), hold on
    plot3(XdataX,XdataY,XdataZ,'-r*')
    plot3(YdataX,YdataY,YdataZ,'-o')
    plot3(ZdataX,ZdataY,ZdataZ,'-b+')
    
    xlim([-250 250])
    ylim([-500 500])
    zlim([-300 100])
    
    axis equal, view(3), grid on
    legend('X axis','Y axis', 'Z axis')
    xlabel('X axis')
    ylabel('Y axis')
    zlabel('Z axis')
    