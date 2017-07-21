% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 702.814278670812314 ; 701.920817271115197 ];

%-- Principal point:
cc = [ 640.835935492526687 ; 349.862303252165873 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.170143494141469 ; 0.025031062258083 ; -0.000398940036290 ; 0.000335654271858 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 1.728725950192364 ; 1.614584256198711 ];

%-- Principal point uncertainty:
cc_error = [ 1.552973077325168 ; 1.344226455996019 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.001384712424327 ; 0.001115511446494 ; 0.000223193092218 ; 0.000296897113882 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 720;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 20;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 3.810378e-01 ; 2.929387e-01 ; 1.539101e+00 ];
Tc_1  = [ 3.013081e+02 ; -2.983484e+02 ; 7.156992e+02 ];
omc_error_1 = [ 2.388889e-03 ; 2.304929e-03 ; 4.725496e-04 ];
Tc_error_1  = [ 1.682074e+00 ; 1.429648e+00 ; 2.085585e+00 ];

%-- Image #2:
omc_2 = [ 1.877826e-01 ; 3.396813e-02 ; 1.537949e+00 ];
Tc_2  = [ 2.972614e+02 ; -2.986029e+02 ; 7.266707e+02 ];
omc_error_2 = [ 2.334816e-03 ; 2.196322e-03 ; 2.914705e-04 ];
Tc_error_2  = [ 1.690036e+00 ; 1.455358e+00 ; 2.083829e+00 ];

%-- Image #3:
omc_3 = [ -5.230825e-02 ; -2.493868e-01 ; 1.494595e+00 ];
Tc_3  = [ 4.555137e+02 ; -9.206479e+01 ; 9.315005e+02 ];
omc_error_3 = [ 2.442159e-03 ; 2.506904e-03 ; 5.376709e-04 ];
Tc_error_3  = [ 2.041957e+00 ; 1.864897e+00 ; 2.574231e+00 ];

%-- Image #4:
omc_4 = [ -2.958176e-02 ; -1.106469e-01 ; 1.589256e+00 ];
Tc_4  = [ 2.874952e+02 ; -2.851016e+02 ; 1.263432e+03 ];
omc_error_4 = [ 3.932603e-03 ; 3.838121e-03 ; 4.424541e-04 ];
Tc_error_4  = [ 2.802309e+00 ; 2.439620e+00 ; 3.359286e+00 ];

%-- Image #5:
omc_5 = [ 2.170418e-01 ; 2.184193e-01 ; 1.548580e+00 ];
Tc_5  = [ 1.685944e+02 ; -2.950482e+02 ; 1.131740e+03 ];
omc_error_5 = [ 2.972982e-03 ; 2.922245e-03 ; 5.036871e-04 ];
Tc_error_5  = [ 2.547428e+00 ; 2.177024e+00 ; 2.942947e+00 ];

%-- Image #6:
omc_6 = [ -5.255734e-01 ; 4.197638e-01 ; 1.479247e+00 ];
Tc_6  = [ 1.803849e+02 ; -2.344739e+02 ; 1.662934e+03 ];
omc_error_6 = [ 2.778150e-03 ; 2.654645e-03 ; 1.024888e-03 ];
Tc_error_6  = [ 3.675891e+00 ; 3.184536e+00 ; 3.925021e+00 ];

%-- Image #7:
omc_7 = [ 7.133512e-02 ; 1.327097e-01 ; 1.913644e+00 ];
Tc_7  = [ 7.163049e+02 ; -1.380379e+02 ; 1.264827e+03 ];
omc_error_7 = [ 4.389739e-03 ; 3.910944e-03 ; 5.504121e-04 ];
Tc_error_7  = [ 2.853349e+00 ; 2.566483e+00 ; 3.790531e+00 ];

%-- Image #8:
omc_8 = [ -2.463929e-01 ; -6.241968e-02 ; 1.441518e+00 ];
Tc_8  = [ 4.331512e+02 ; -1.128083e+02 ; 1.130943e+03 ];
omc_error_8 = [ 2.628946e-03 ; 2.695499e-03 ; 4.494771e-04 ];
Tc_error_8  = [ 2.466311e+00 ; 2.219814e+00 ; 2.859160e+00 ];

%-- Image #9:
omc_9 = [ -3.636344e-01 ; 7.260899e-02 ; 1.416198e+00 ];
Tc_9  = [ 4.109184e+02 ; -1.073655e+02 ; 1.239951e+03 ];
omc_error_9 = [ 2.708838e-03 ; 2.732715e-03 ; 5.059325e-04 ];
Tc_error_9  = [ 2.702617e+00 ; 2.415184e+00 ; 2.980275e+00 ];

%-- Image #10:
omc_10 = [ -4.961781e-01 ; -9.864983e-02 ; 1.382036e+00 ];
Tc_10  = [ 3.390162e+02 ; -1.405454e+02 ; 1.332121e+03 ];
omc_error_10 = [ 2.551983e-03 ; 2.551407e-03 ; 6.576293e-04 ];
Tc_error_10  = [ 2.917885e+00 ; 2.578060e+00 ; 2.970856e+00 ];

%-- Image #11:
omc_11 = [ -1.550439e-01 ; -2.505483e-01 ; 1.556227e+00 ];
Tc_11  = [ 6.542335e+02 ; -3.587356e+02 ; 2.133718e+03 ];
omc_error_11 = [ 3.892322e-03 ; 3.694904e-03 ; 1.001852e-03 ];
Tc_error_11  = [ 4.790279e+00 ; 4.166512e+00 ; 5.545828e+00 ];

%-- Image #12:
omc_12 = [ 3.038744e-02 ; 1.810639e-01 ; 2.192428e+00 ];
Tc_12  = [ 9.506630e+02 ; 2.915505e+01 ; 2.016494e+03 ];
omc_error_12 = [ 6.785813e-03 ; 6.856106e-03 ; 9.552139e-04 ];
Tc_error_12  = [ 4.549716e+00 ; 4.049933e+00 ; 5.599875e+00 ];

%-- Image #13:
omc_13 = [ 6.515187e-01 ; 6.096277e-01 ; 1.502038e+00 ];
Tc_13  = [ 9.967857e+02 ; 1.166187e+02 ; 1.489863e+03 ];
omc_error_13 = [ 3.959634e-03 ; 3.975074e-03 ; 1.600126e-03 ];
Tc_error_13  = [ 3.530947e+00 ; 3.177260e+00 ; 5.034933e+00 ];

%-- Image #14:
omc_14 = [ -2.575711e-01 ; -3.081317e-01 ; 1.543612e+00 ];
Tc_14  = [ 5.769817e+02 ; 9.798431e+01 ; 1.972570e+03 ];
omc_error_14 = [ 3.232057e-03 ; 3.200312e-03 ; 7.864985e-04 ];
Tc_error_14  = [ 4.364237e+00 ; 3.872882e+00 ; 4.904640e+00 ];

%-- Image #15:
omc_15 = [ -2.188698e-01 ; -5.111882e-01 ; 9.366408e-01 ];
Tc_15  = [ -5.356912e+02 ; -1.716238e+02 ; 1.916053e+03 ];
omc_error_15 = [ 4.901613e-03 ; 5.098276e-03 ; 9.666842e-04 ];
Tc_error_15  = [ 4.427211e+00 ; 3.741474e+00 ; 5.172526e+00 ];

%-- Image #16:
omc_16 = [ -5.252976e-01 ; -5.597071e-01 ; 1.489514e+00 ];
Tc_16  = [ -8.644225e+02 ; 1.160466e+02 ; 1.702651e+03 ];
omc_error_16 = [ 5.570055e-03 ; 5.656173e-03 ; 1.835566e-03 ];
Tc_error_16  = [ 4.052392e+00 ; 3.463424e+00 ; 5.761218e+00 ];

%-- Image #17:
omc_17 = [ -5.941940e-01 ; -6.273457e-01 ; 1.464240e+00 ];
Tc_17  = [ -5.558088e+02 ; 1.259561e+02 ; 1.375179e+03 ];
omc_error_17 = [ 3.353345e-03 ; 3.368767e-03 ; 1.079400e-03 ];
Tc_error_17  = [ 3.209399e+00 ; 2.715778e+00 ; 3.874514e+00 ];

%-- Image #18:
omc_18 = [ -7.630097e-01 ; -6.920788e-01 ; 1.575025e+00 ];
Tc_18  = [ -1.645541e+02 ; 1.132011e+02 ; 1.214112e+03 ];
omc_error_18 = [ 2.415033e-03 ; 2.332536e-03 ; 8.205014e-04 ];
Tc_error_18  = [ 2.716526e+00 ; 2.307761e+00 ; 2.434012e+00 ];

%-- Image #19:
omc_19 = [ -5.713836e-01 ; -4.832437e-01 ; 1.452194e+00 ];
Tc_19  = [ 1.637146e+02 ; -3.064051e+02 ; 1.585350e+03 ];
omc_error_19 = [ 2.721334e-03 ; 2.512014e-03 ; 9.417110e-04 ];
Tc_error_19  = [ 3.520491e+00 ; 3.035966e+00 ; 3.474196e+00 ];

%-- Image #20:
omc_20 = [ -4.637393e-01 ; -5.263379e-01 ; 1.660255e+00 ];
Tc_20  = [ 1.409752e+02 ; -3.070791e+02 ; 1.439641e+03 ];
omc_error_20 = [ 2.934871e-03 ; 2.630644e-03 ; 8.822614e-04 ];
Tc_error_20  = [ 3.209085e+00 ; 2.748219e+00 ; 3.204999e+00 ];

