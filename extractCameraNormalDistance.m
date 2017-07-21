function [thetac, alphac] = extractCameraNormalDistance(CameraPlane)
%% extract plane normals and distance to plane
% CameraPlanePoses: 4*4*N
% LidarPlanes: 4*N

% pre-allocate memory
thetac = zeros(3, size(CameraPlane,3)); % Normals of plane in camera frame
alphac = zeros(1, size(CameraPlane,3)); % Distance to plane in camera frame

for i = 1:size(CameraPlane,3)
    r3=CameraPlane(1:3,3,i); % N = r3
    d_cw=CameraPlane(1:3,4,i)'*r3; % d = t'*r3  
    if(d_cw<0)
        r3=-r3; d_cw=-d_cw;
    end
    thetac(:,i)=r3;
    alphac(:,i)=d_cw;
end

% Conversion from mm (MCCT fomat) to metres (ladar data format)
% alphac=alphac.*1.0e-3;