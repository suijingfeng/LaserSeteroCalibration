function [PhiEnd, DeltaEnd,fval] = OptimalLaserCameraExtrinsic(PhiInit, ...
DeltaInit, nc, dc, LaserPlanesPoints, segLen, method)
%%
% Method = 0 : fminunc, 1: fminsearch, 2: lsqnonli
% DeltaInit: initial value for translation relate laser to camera.
% PhiInit: initial value represences the Laser frame in camera frame  
% thetac: 3xN Normals of Plane in Camera frame.
% alphac: 1xN distance of camera origin to chessboard

if method == 0
    var=[rodrigues(PhiInit) ; DeltaInit];

    options = optimset('Algorithm','levenberg-marquardt','MaxIter',...
            1000000,'TolFun', 10^-6);
    [par_est, fval]=fminsearch(@RmsErrorPointsToPlanes, var, options, ...
            LaserPlanesPoints, segLen, nc, dc);

    % Convert back to rotation matrix
    PhiEnd = rodrigues(par_est(1:3));
    DeltaEnd = par_est(4:6);
else
%     var=[rodrigues(PhiInit); DeltaInit];
%     %Last optimisation uses the Levenberg Marquardt method
%     options = optimset('Algorithm','levenberg-marquardt','Display','off');
%     options = optimset(options, 'MaxFunEvals', 10000000);
% 
%     var = lsqnonlin(@RmsErrorPointsToPlanes, var, ...
%      options, LaserPlanesPoints, segLen, nc, dc);

end