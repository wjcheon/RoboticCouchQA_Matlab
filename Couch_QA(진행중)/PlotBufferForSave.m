
figure(1),hold on;
for kk= 1: size(BufferForSave,1)
    
    scatter3(BufferForSave(kk,1),BufferForSave(kk,2),BufferForSave(kk,3));
end
axis equal
grid on 
view(3);