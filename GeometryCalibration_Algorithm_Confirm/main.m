clc
clear
close all
%% ReferenceCube
DistanceOfReference = 120; % unit is [mm]
ReferecneCoordinates = [ 0, 0, 0 ; 0, DistanceOfReference, 0 ; ...
    DistanceOfReference, 0, 0 ; DistanceOfReference, DistanceOfReference, 0]';
[ReferenceCube] = GenerateCube(ReferecneCoordinates);

%% ModifiedCube
ReferenceCubeForInv = [ReferenceCube ; 1 1 1 1 1 1 1 1]';
[ModifiedCubeForInv] = RotateTranslate3d(ReferenceCubeForInv ,40,30,20,1000,15,33);
ModifedCube = ModifiedCubeForInv(:,1:3)';
%% Plotting
figure, DrawCube(ReferenceCube,1,'r')
DrawCube(ModifedCube,1,'b')
axis equal

%% Get RelationMatrix
RelationMatrix = ReferenceCubeForInv'*pinv(ModifiedCubeForInv')


%%
ScaleFactor = 250;
vector_x = (ModifedCube(1:3,3) - ModifedCube(1:3,1))./...
    norm(ModifedCube(1:3,3) - ModifedCube(1:3,1));
vector_x_scaled =ModifedCube(1:3,1)+ (vector_x *ScaleFactor);
figure(1),hold on;
scatter3(vector_x_scaled(1),vector_x_scaled(2),vector_x_scaled(3))
axis equal
ForecastCoordinatesVectorX = RelationMatrix* [vector_x_scaled ;1]

%%
SetCoordinates = [250 0 0]
figure(1),hold on;
scatter3(SetCoordinates(1),SetCoordinates(2),SetCoordinates(3),'r');
axis equal
SetCoordinatesForInv = [SetCoordinates 1]
[ModifiedCoordinates] = RotateTranslate3d(SetCoordinatesForInv ,40,30,20,1000,15,33);
TransferredCoordinates = RelationMatrix*ModifiedCoordinates'
figure(1), hold on;
scatter3(ModifiedCoordinates(1),ModifiedCoordinates(2),ModifiedCoordinates(3))
axis equal




