% 
%   m = 3 x 4 maxtrix : 4 point - upper point of Cube. 
% 
% 
% 
% 


function [Cube_point] = GenerateCube(m)
    
    Cube_point = zeros(size(m,1),size(m,2));
    Cube_point = m;
    dist_bw_markers = zeros(1,3);
    dist_bw_markers(1,1) = dist3d(Cube_point(:,1),Cube_point(:,2));
    dist_bw_markers(1,2) = dist3d(Cube_point(:,1),Cube_point(:,3));
    dist_bw_markers(1,3) = dist3d(Cube_point(:,1),Cube_point(:,4));
    dist_bw_marker =[];
    
    if abs(dist_bw_markers(1,1)-dist_bw_markers(1,2)) > ...
            abs(dist_bw_markers(1,1)-dist_bw_markers(1,3))
        
        dist_bw_marker = dist_bw_markers(1,3);
    else
        dist_bw_marker = dist_bw_markers(1,2);
               
    end
    
    base_updown_vector = cross(Cube_point(:,1)-Cube_point(:,2),...
        Cube_point(:,1)-Cube_point(:,4));
    
    
    norm_p = norm(base_updown_vector);
    base_updown_vector = base_updown_vector./norm_p;
    
    Cube_point(1:3,5) = Cube_point(:,1) + dist_bw_marker*base_updown_vector;
    Cube_point(1:3,6) = Cube_point(:,2) + dist_bw_marker*base_updown_vector;
    Cube_point(1:3,7) = Cube_point(:,3) + dist_bw_marker*base_updown_vector;
    Cube_point(1:3,8) = Cube_point(:,4) + dist_bw_marker*base_updown_vector;

    
end
