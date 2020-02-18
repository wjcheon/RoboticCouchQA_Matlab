
function [dist] = GetSSW(P1,P2)
    
    if(size(P1,1) == 3 || size(P1,2) ==3)
        dist =  sqrt((P1(1)-P2(1)).^2 + (P1(2)-P2(2)).^2 + (P1(3)-P2(3)).^2);
    else
        C1(1) = (P1(1) + P2(1))/2
        C1(2) = (P1(2) + P2(2))/2
        dist =  GetDist(P1,C1).^2 + GetDist(P2,C1).^2
    end  
end