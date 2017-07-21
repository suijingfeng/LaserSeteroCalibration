function [LaserPlanesPoint,segLen,totalPoints]= OrganizeLaserPlanePoints(laserPlanes)
%% laserPlanes : 1xM cell, points in cell is col organised(Nx3)
%
totalPoints = 0; % total number of points


for i = 1:size(laserPlanes, 2) % number of planes
    totalPoints = totalPoints + size(laserPlanes{1, i}, 1);
end

LaserPlanesPoint=zeros(totalPoints, 3);
segLen=zeros(size(laserPlanes, 2), 1);

% stack all the inliers in selected plane points
Index = 1;
endIndex = 0;
for i = 1:size(laserPlanes, 2) % number of planes
    endIndex = endIndex + size(laserPlanes{i}, 1);
    % number of inliers in selected plane points
    LaserPlanesPoint(Index:endIndex,1:3) = laserPlanes{i};
    segLen(i,1)=size(laserPlanes{i}, 1);
    Index = endIndex + 1;
end