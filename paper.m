clc
clear
close all

%%
    Data = xlsread('figure6.xlsx');
    Xaxis = Data(5,2:22)
    Xdata = Data(6,2:22)
    Yaxis = Data(20,2:22)
    Ydata = Data(21,2:22)
    Zaxis = Data(35,2:12)
    Zdata = Data(36,2:12)
    
    %%
    
    figure(1), hold on 
    plot(Xaxis,Xdata,'-r*')
    plot(Yaxis,Ydata,'-o')
    plot(Zaxis,Zdata,'-b+')
    
    xlabel('Requested magnitude [mm]')
    ylabel('Measured magnitude [mm]')
    legend('X axis','Y axis', 'Z axis')
    
    axis equal
    grid on