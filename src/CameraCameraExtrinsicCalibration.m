%% run extrinsic calibration
% prepare the data.

%% Ri Ti -> thetac(Nc), alphac(Dc)
[n_l, d_l] = GetCameraNorDis('Calib_Results_left.mat');
%% LaserPlanesParas : ax + by + cz + d = 0 => (a, b, c) d
[n_r, d_r] = GetCameraNorDis('Calib_Results_right.mat');

%% Closed form (linear) solution for translation vector.
DeltaInit = (n_l' * n_l)\(n_l' *(d_l - d_r))
% the origin of laser reference frame expressed in Camera reference frame

[U,S,V] = svd(n_r' * n_l);
PhiInit = V*U';
if(det(PhiInit)<0)
    PhiInit = V * diag([ ones(size(V, 2)-1, 1) ; -1]) * U';
end
rpyinit = rotm2eul(PhiInit)./pi * 180

%  %% Evaluation the linear solution
%  var = [rodrigues(PhiInit); DeltaInit];
%  LinearRms = RmsErrorPointsToPlanes(var, LaserPlanesPoints', segLen, n_l, d_l)
% 
% 
% %% Nonlinear Optimal solution for Rotation and translation. 
% [PhiEnd, DeltaEnd, fval] = OptimalLaserCameraExtrinsic(PhiInit, DeltaInit,...
%     n_l,d_l, LaserPlanesPoints, segLen, 0)
% rpy = rotm2eul(PhiEnd)./pi * 180
%  % Evaluation the final solution
% var = [rodrigues(PhiEnd); DeltaEnd];
