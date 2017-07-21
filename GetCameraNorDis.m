function [Nc, Dc] = GetCameraNorDis(filename)
%% USAGE:
%   thetac: normal vector Nx3 describing the plane in camera frame 
%   alphac: the distance  NX1 to the plane from the camera origin in metres
%   NOTE:   Magnitude describes distance to plane in METRES
%           Vector is from plane to camera origin
%
% Written by Sui Jingfeng 2017.03.05
%% test
load(filename);

stringRBase = 'Rc_';
stringTBase = 'Tc_';
base = 1;
Nc = []; % Normals of plane in camera frame
Dc = []; % Distance to plane in camera frame

while( exist([stringRBase, num2str(base)], 'var') && ...
       exist([stringTBase, num2str(base)], 'var') )
   
    rc = eval([stringRBase, num2str(base)]);
    tc = eval([stringTBase, num2str(base)]);
    
    Nc = [Nc; rc(:, 3)'];
    Dc = [Dc; rc(:, 3)'*tc*1.0e-3];
     
    base = base + 1;
end