% 
% m = 3 x 8 matrix : 8 point 
% 
% 
% 



function [] = DrawCube(m,cross,cor)
    
    for jj = 1 : size(m,2)
        
        Cube_point = m;
        if cross == 1
            Cube_point = [Cube_point(:,1:2),fliplr(Cube_point(:,3:4)),...
                Cube_point(:,5:6),fliplr(Cube_point(:,7:8))];
        else
            Cube_point = Cube_point;
        end
        
       hold on; 
       scatter3(Cube_point(1,jj),Cube_point(2,jj),Cube_point(3,jj), 'MarkerFaceColor',cor );
               
       Cube_point1  = [Cube_point(:,1),Cube_point(:,2),Cube_point(:,3),Cube_point(:,4),Cube_point(:,1)];
       Cube_point2 = [Cube_point(:,5),Cube_point(:,6),Cube_point(:,7),Cube_point(:,8),Cube_point(:,5)];
       Cube_point3 = [Cube_point(:,1),Cube_point(:,5)];
       Cube_point4 = [Cube_point(:,2),Cube_point(:,6)];
       Cube_point5 = [Cube_point(:,3),Cube_point(:,7)];
       Cube_point6 = [Cube_point(:,4),Cube_point(:,8)];
       
       plot3(Cube_point1(1,:),Cube_point1(2,:),Cube_point1(3,:),'Color',cor)
       plot3(Cube_point2(1,:),Cube_point2(2,:),Cube_point2(3,:),'Color',cor)
       plot3(Cube_point3(1,:),Cube_point3(2,:),Cube_point3(3,:),'Color',cor)
       plot3(Cube_point4(1,:),Cube_point4(2,:),Cube_point4(3,:),'Color',cor)
       plot3(Cube_point5(1,:),Cube_point5(2,:),Cube_point5(3,:),'Color',cor)
       plot3(Cube_point6(1,:),Cube_point6(2,:),Cube_point6(3,:),'Color',cor)
      
        

        
    end

    grid on
    view(3)
    
end
