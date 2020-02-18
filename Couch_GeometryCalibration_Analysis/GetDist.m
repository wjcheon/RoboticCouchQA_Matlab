
function [dist] = getdist(P1,P2)
    
    if(size(P1,1) == 3 || size(P1,2) ==3)
        dist =  sqrt((P1(1)-P2(1)).^2 + (P1(2)-P2(2)).^2 + (P1(3)-P2(3)).^2);
    else
        dist =  sqrt((P1(1)-P2(1)).^2 + (P1(2)-P2(2)).^2);
    end
    
end