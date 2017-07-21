% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 702.692928772916616 ; 701.724481781684972 ];

%-- Principal point:
cc = [ 640.853409607030699 ; 349.518802986290154 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.152174020021762 ; -0.018888038541608 ; -0.000345067522309 ; 0.000340120543651 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 2.770552106144769 ; 2.689367642374994 ];

%-- Principal point uncertainty:
cc_error = [ 1.875352665557281 ; 1.621249702005561 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.004831089358908 ; 0.012349910912773 ; 0.000403496593320 ; 0.000562542842713 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 720;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 10;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 3.801829e-01 ; 2.933395e-01 ; 1.539093e+00 ];
Tc_1  = [ 3.013360e+02 ; -2.980269e+02 ; 7.169507e+02 ];
omc_error_1 = [ 2.732926e-03 ; 2.814512e-03 ; 5.594295e-04 ];
Tc_error_1  = [ 2.033286e+00 ; 1.726664e+00 ; 3.141169e+00 ];

%-- Image #2:
omc_2 = [ 1.864525e-01 ; 3.478256e-02 ; 1.538002e+00 ];
Tc_2  = [ 2.972759e+02 ; -2.982994e+02 ; 7.280475e+02 ];
omc_error_2 = [ 2.700521e-03 ; 2.781811e-03 ; 3.116618e-04 ];
Tc_error_2  = [ 2.042635e+00 ; 1.756948e+00 ; 3.120286e+00 ];

%-- Image #3:
omc_3 = [ -5.312489e-02 ; -2.506823e-01 ; 1.494629e+00 ];
Tc_3  = [ 4.554381e+02 ; -9.161870e+01 ; 9.328811e+02 ];
omc_error_3 = [ 2.934657e-03 ; 3.107989e-03 ; 6.271362e-04 ];
Tc_error_3  = [ 2.470610e+00 ; 2.253024e+00 ; 3.888412e+00 ];

%-- Image #4:
omc_4 = [ -3.150518e-02 ; -1.091594e-01 ; 1.589278e+00 ];
Tc_4  = [ 2.874432e+02 ; -2.845103e+02 ; 1.264656e+03 ];
omc_error_4 = [ 4.285506e-03 ; 4.107925e-03 ; 4.525095e-04 ];
Tc_error_4  = [ 3.390890e+00 ; 2.942674e+00 ; 5.163146e+00 ];

%-- Image #5:
omc_5 = [ 2.167489e-01 ; 2.202217e-01 ; 1.548457e+00 ];
Tc_5  = [ 1.685379e+02 ; -2.945139e+02 ; 1.132353e+03 ];
omc_error_5 = [ 3.422573e-03 ; 3.438452e-03 ; 5.598659e-04 ];
Tc_error_5  = [ 3.071739e+00 ; 2.624311e+00 ; 4.631377e+00 ];

%-- Image #6:
omc_6 = [ -5.254906e-01 ; 4.201280e-01 ; 1.479244e+00 ];
Tc_6  = [ 1.803815e+02 ; -2.337336e+02 ; 1.663562e+03 ];
omc_error_6 = [ 3.286619e-03 ; 3.082536e-03 ; 1.185457e-03 ];
Tc_error_6  = [ 4.449492e+00 ; 3.860745e+00 ; 6.020498e+00 ];

%-- Image #7:
omc_7 = [ 7.020456e-02 ; 1.300483e-01 ; 1.913585e+00 ];
Tc_7  = [ 7.164587e+02 ; -1.374220e+02 ; 1.267455e+03 ];
omc_error_7 = [ 4.795016e-03 ; 4.580930e-03 ; 5.957928e-04 ];
Tc_error_7  = [ 3.438232e+00 ; 3.105711e+00 ; 5.639463e+00 ];

%-- Image #8:
omc_8 = [ -2.467282e-01 ; -6.487886e-02 ; 1.441503e+00 ];
Tc_8  = [ 4.330217e+02 ; -1.123064e+02 ; 1.132206e+03 ];
omc_error_8 = [ 3.057326e-03 ; 3.144004e-03 ; 4.941764e-04 ];
Tc_error_8  = [ 2.970324e+00 ; 2.684337e+00 ; 4.416719e+00 ];

%-- Image #9:
omc_9 = [ -3.633350e-01 ; 7.053123e-02 ; 1.416221e+00 ];
Tc_9  = [ 4.108252e+02 ; -1.068580e+02 ; 1.241224e+03 ];
omc_error_9 = [ 3.069333e-03 ; 3.063436e-03 ; 5.498732e-04 ];
Tc_error_9  = [ 3.248651e+00 ; 2.919323e+00 ; 4.661508e+00 ];

%-- Image #10:
omc_10 = [ -4.953482e-01 ; -1.000646e-01 ; 1.382078e+00 ];
Tc_10  = [ 3.390920e+02 ; -1.400449e+02 ; 1.333533e+03 ];
omc_error_10 = [ 2.958094e-03 ; 2.905735e-03 ; 7.289595e-04 ];
Tc_error_10  = [ 3.489741e+00 ; 3.115347e+00 ; 4.753823e+00 ];

