%% run extrinsic calibration
% prepare the data.
% PCD files -> allPlanesLaserPoints: all Planes inliers point.
loadpcdfiles;
[LaserPlanesPoints, segLen] = OrganizeLaserPlanePoints(allPlanesLaserPoints);
%% Ri Ti -> thetac(Nc), alphac(Dc)
[nc, dc] = GetCameraNorDis('Calib_Results_left.mat');
%% LaserPlanesParas : ax + by + cz + d = 0 => (a, b, c) d
[nl, dl] = extractLaserNormalDistance(LaserPlanesParas);
% %% Closed form (linear) solution for translation vector.
DeltaInit = (nc' * nc)\(nc' *(-dl+dc))
% the origin of laser reference frame expressed in Camera reference frame

[U,S,V] = svd(nl' * nc);
PhiInit = V*U';
if(det(PhiInit)<0)
    PhiInit = V * diag([ ones(size(V,2)-1, 1) ; -1]) * U';
end
rpyinit = rotm2eul(PhiInit)./pi * 180

 % Evaluation the linear solution
 var = [rodrigues(PhiInit); DeltaInit];
 LinearRms = RmsErrorPointsToPlanes(var, LaserPlanesPoints', segLen, nc, dc)


%% Nonlinear Optimal solution for Rotation and translation. 
[PhiEnd, DeltaEnd, fval] = OptimalLaserCameraExtrinsic(PhiInit, DeltaInit,...
    nc,dc, LaserPlanesPoints, segLen, 0)
rpy = rotm2eul(PhiEnd)./pi * 180
 % Evaluation the final solution
var = [rodrigues(PhiEnd); DeltaEnd];
