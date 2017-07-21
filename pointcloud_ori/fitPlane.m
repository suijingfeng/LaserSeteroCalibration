%% Fit a Plane in the Point Cloud
ptCloud = pcread('cloud20.pcd');
% Set the maximum point-to-plane distance (5cm) for plane fitting.
maxDistance = 0.04;
%%
% Set the normal vector of the plane.
%referenceVector = [1,0,0];
%%
% Set the maximum angular distance to 5 degrees.
%maxAngularDistance = 5;
%%
% Detect the first plane, the table, and extract it from the point cloud.
%[model1,inlierIndices,outlierIndices] = pcfitplane(ptCloud, maxDistance,referenceVector,maxAngularDistance);
%%
[model1,inlierIndices,outlierIndices] = pcfitplane(ptCloud, maxDistance);
plane1 = select(ptCloud, inlierIndices);
plane1.Count
remainPtCloud = select(ptCloud, outlierIndices);
%% calculate error
%D = abs( model1.Normal * ptCloud.Location');
%error = D - abs( model1.Parameters(1,4) );
%hist(error,40);

%%
% Set the region of interest to constrain the search for the second plane,
% left wall.
%roi = [-inf,inf;0.4,inf;-inf,inf];
%sampleIndices = findPointsInROI(remainPtCloud,roi);
%%
% Detect the back plane and extract it from the remaining point cloud.
[model2, inlierIndices, outlierIndices] = pcfitplane(remainPtCloud,...
           maxDistance);
%[model2, inlierIndices, outlierIndices] = pcfitplane(remainPtCloud, maxDistance);
%model2
plane2 = select(remainPtCloud, inlierIndices);
remainPtCloud = select(remainPtCloud, outlierIndices);

%%
% Detect the back plane and extract it from the remaining point cloud.
[model3, inlierIndices, outlierIndices] = pcfitplane(remainPtCloud,...
           maxDistance);
plane3 = select(remainPtCloud, inlierIndices);
remainPtCloud = select(remainPtCloud, outlierIndices);

% Plot the two planes and the remaining points.
% figure
% %subplot(1,3,1)
% xlabel('X(m)')
% ylabel('Y(m)')
% zlabel('Z(m)')
% axis on
% pcshow(plane1)
% title('plane1')


figure
pcshow(plane2)
xlabel('X(m)')
ylabel('Y(m)')
zlabel('Z(m)')
axis on
title('plane2')

figure
pcshow(plane3)
xlabel('X(m)')
ylabel('Y(m)')
zlabel('Z(m)')
axis on
title('plane3')

% figure
% pcshow(remainPtCloud)
% xlabel('X(m)')
% ylabel('Y(m)')
% zlabel('Z(m)')
% axis on
% title('Remaining Point Cloud')
%fine = find( (plane3.Location(:, 1) < 0.2) & ...
%(plane3.Location(:, 2) < 2) & (plane3.Location(:, 3) < 0.2));
%cb = select(plane3, fine);
%pcwrite(cb, 'plane_01.pcd');

