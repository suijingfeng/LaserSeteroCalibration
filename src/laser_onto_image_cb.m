% LASER_ONTO_IMAGE_CB is called to reproject laser points from a laser
% range finder onto an image. This can be useful for the verification of
% the calibration results.
% 
% Calib_Results.mat file needs to present in order to retrieve the camera
% calibration parameters.
% created by suijingfeng  2017.03.06
% Email: suijingfeng2014@ia.ac.cn

if ~exist('./Calib_Results_left.mat','file')
    disp('Calib_Results.mat is needed to proceed.');
    return;
end

% load camera calibration results.
load Calib_Results_left.mat fc cc kc alpha_c fc_error cc_error kc_error alpha_c_error;

% adjust errors, divide by 3 to get standard deviation (the camera
% calibraiton toolbox outputs 3 times the standard deviation as an
% uncertainty).
fc_error=fc_error./3;
cc_error=cc_error./3;
kc_error=kc_error./3;
alpha_c_error=alpha_c_error./3;

% select images
list_img = dir('*.png');
%list_pc = dir('./unionCalib/*.pcd');
list_pc = dir('*.pcd');
size_png = size(list_img, 1);

if size_png < 1
    fprintf(1,'No *.png in this directory, change directory and try again.\n');
    return;
end;

I_num=input('Select image numbers to display ([]=none):');
if isempty(I_num)
    disp('File does not exist.');
    return;
end
%pc_name = [list_pc(I_num).folder,'/' ,list_pc(I_num).name]
%pc = pcread('cloud06.pcd');
pc = pcread(list_pc(I_num).name);
Img = imread(list_img(I_num).name);
%eval(['Img_' num2str(I_num) ' = imread(img_name);']);

ProjectLaserIntoImage(Img, pc, DeltaEnd, PhiEnd, fc, cc, kc, alpha_c);

