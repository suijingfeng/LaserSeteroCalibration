function [cameraPlanes] = GetCameraPlanes2(filename);
% USAGE:
%   [cameraPlanes] = GetCameraPlanes()
%   After running the Camera Calibration Toolbox and saving Calib_Results.mat
%   This function will load that file (current directory assumed)
%   For every available Rc_n and Tc_n now in the workspace it will create a
%   normal vector N ~ 3x1 describing the plane.  Magnitude of vector is the
%   distance to the plane from the camera origin in metres
%
%   NOTE:   Magnitude describes distance to plane in METRES
%           Vector is from plane to camera origin
%
% Written by James Underwood 10/07/06
%


cameraPlanes=[];
load(filename);

stringRBase = 'Rc_';
stringTBase = 'Tc_';

base = 1;
%for n = selectionNumbers
while( exist([stringRBase,num2str(base)]) && exist([stringTBase,num2str(base)]) )
  
    rc = eval([stringRBase,num2str(base)]);
    tc = eval([stringTBase,num2str(base)]);
    
    plane = -rc(:,3) * dot(rc(:,3)', tc); % see cam/laser paper
    plane = -plane; % mm
    cameraPlanes=[cameraPlanes,plane];
    
    base = base + 1;
end

if isempty(cameraPlanes)
    error('No Rc_# or Tc_# variables found in Calib_Results.mat - check the camera calibration');
end
