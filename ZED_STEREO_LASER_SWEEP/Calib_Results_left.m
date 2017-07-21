% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 700.575628318322288 ; 700.584351446427036 ];

%-- Principal point:
cc = [ 644.185747917361596 ; 347.393336327248051 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.173361922215230 ; 0.025608197114975 ; -0.000352813925344 ; 0.000446588643795 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 3.929528466933863 ; 4.028957482634211 ];

%-- Principal point uncertainty:
cc_error = [ 4.058448240448699 ; 3.857546591140663 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.004110796010254 ; 0.003302328866047 ; 0.000768716310014 ; 0.000538143002769 ; 0.000000000000000 ];

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
omc_1 = [ -7.407064e-01 ; -3.677659e-01 ; 1.401995e+00 ];
Tc_1  = [ -1.428185e+02 ; 9.891345e+01 ; 1.383808e+03 ];
omc_error_1 = [ 6.986132e-03 ; 7.038082e-03 ; 1.990127e-03 ];
Tc_error_1  = [ 8.141211e+00 ; 7.629352e+00 ; 6.504190e+00 ];

%-- Image #2:
omc_2 = [ -8.471414e-02 ; -7.494619e-02 ; 1.575380e+00 ];
Tc_2  = [ 4.489343e+02 ; 8.145269e+01 ; 1.339753e+03 ];
omc_error_2 = [ 7.484777e-03 ; 8.224064e-03 ; 1.202815e-03 ];
Tc_error_2  = [ 7.698056e+00 ; 7.507375e+00 ; 8.083523e+00 ];

%-- Image #3:
omc_3 = [ -2.194825e-01 ; 7.986854e-01 ; 1.616565e+00 ];
Tc_3  = [ 6.462730e+02 ; 1.811948e+02 ; 1.395020e+03 ];
omc_error_3 = [ 8.703968e-03 ; 8.229008e-03 ; 2.034082e-03 ];
Tc_error_3  = [ 8.169875e+00 ; 8.095796e+00 ; 8.884914e+00 ];

%-- Image #4:
omc_4 = [ -2.556861e-01 ; -9.580519e-02 ; 1.551784e+00 ];
Tc_4  = [ -2.606824e+01 ; 8.487594e+01 ; 1.437525e+03 ];
omc_error_4 = [ 1.065551e-02 ; 1.033379e-02 ; 1.705922e-03 ];
Tc_error_4  = [ 8.345634e+00 ; 7.844715e+00 ; 8.681213e+00 ];

%-- Image #5:
omc_5 = [ -2.183510e-01 ; -1.659695e-01 ; 1.563608e+00 ];
Tc_5  = [ 8.329141e+02 ; 8.076368e+01 ; 1.481655e+03 ];
omc_error_5 = [ 6.673509e-03 ; 7.911571e-03 ; 1.943405e-03 ];
Tc_error_5  = [ 8.648812e+00 ; 8.755599e+00 ; 9.857212e+00 ];

%-- Image #6:
omc_6 = [ -4.786146e-01 ; -2.990701e-01 ; 1.505914e+00 ];
Tc_6  = [ -4.081442e+02 ; 9.125987e+01 ; 2.228827e+03 ];
omc_error_6 = [ 1.484897e-02 ; 1.521353e-02 ; 3.378194e-03 ];
Tc_error_6  = [ 1.337118e+01 ; 1.232703e+01 ; 1.255286e+01 ];

%-- Image #7:
omc_7 = [ -6.300221e-02 ; 1.986827e-01 ; 2.334449e+00 ];
Tc_7  = [ 8.939998e+02 ; 1.572408e+02 ; 1.433206e+03 ];
omc_error_7 = [ 1.032105e-02 ; 1.019683e-02 ; 1.310098e-03 ];
Tc_error_7  = [ 8.444363e+00 ; 8.446504e+00 ; 1.045165e+01 ];

%-- Image #8:
omc_8 = [ 6.106647e-01 ; 9.702675e-02 ; 1.453038e+00 ];
Tc_8  = [ 7.967427e+02 ; 1.194384e+02 ; 8.696682e+02 ];
omc_error_8 = [ 7.381087e-03 ; 7.737374e-03 ; 3.417059e-03 ];
Tc_error_8  = [ 5.273642e+00 ; 5.604467e+00 ; 9.021630e+00 ];

%-- Image #9:
omc_9 = [ 4.331379e-01 ; 1.001823e-01 ; 1.517523e+00 ];
Tc_9  = [ 5.892907e+02 ; 9.693544e+01 ; 1.002896e+03 ];
omc_error_9 = [ 6.893444e-03 ; 7.670975e-03 ; 2.329678e-03 ];
Tc_error_9  = [ 5.993446e+00 ; 5.900540e+00 ; 7.568810e+00 ];

%-- Image #10:
omc_10 = [ 9.016144e-01 ; 4.291092e-01 ; 1.307414e+00 ];
Tc_10  = [ 2.695143e+02 ; 1.202232e+02 ; 1.237967e+03 ];
omc_error_10 = [ 6.685936e-03 ; 6.233778e-03 ; 3.499757e-03 ];
Tc_error_10  = [ 7.171558e+00 ; 6.958336e+00 ; 8.162091e+00 ];

%-- Image #11:
omc_11 = [ 5.880877e-01 ; 7.536445e-02 ; 1.465751e+00 ];
Tc_11  = [ 4.306944e+02 ; 1.210753e+02 ; 9.692900e+02 ];
omc_error_11 = [ 6.437728e-03 ; 6.923252e-03 ; 2.585367e-03 ];
Tc_error_11  = [ 5.700398e+00 ; 5.571308e+00 ; 6.765548e+00 ];

%-- Image #12:
omc_12 = [ -2.103883e-02 ; -2.767826e-01 ; 1.584919e+00 ];
Tc_12  = [ 4.366290e+02 ; 9.181243e+01 ; 1.087052e+03 ];
omc_error_12 = [ 5.942846e-03 ; 6.999185e-03 ; 1.567119e-03 ];
Tc_error_12  = [ 6.226620e+00 ; 6.173768e+00 ; 6.614987e+00 ];

%-- Image #13:
omc_13 = [ 2.992590e-01 ; -8.037632e-02 ; 1.546352e+00 ];
Tc_13  = [ 2.212763e+02 ; 1.044175e+02 ; 1.212786e+03 ];
omc_error_13 = [ 6.860704e-03 ; 7.130414e-03 ; 1.831412e-03 ];
Tc_error_13  = [ 7.045749e+00 ; 6.736523e+00 ; 7.418433e+00 ];

%-- Image #14:
omc_14 = [ -1.328988e-02 ; -5.130739e-01 ; 1.599801e+00 ];
Tc_14  = [ -6.378349e+01 ; 1.193356e+02 ; 1.060777e+03 ];
omc_error_14 = [ 6.929657e-03 ; 6.244012e-03 ; 1.618138e-03 ];
Tc_error_14  = [ 6.279624e+00 ; 5.811245e+00 ; 6.338668e+00 ];

%-- Image #15:
omc_15 = [ -3.421971e-01 ; -5.642631e-01 ; 1.570097e+00 ];
Tc_15  = [ -3.293622e+02 ; 9.464356e+01 ; 1.578714e+03 ];
omc_error_15 = [ 8.132155e-03 ; 8.118488e-03 ; 1.812958e-03 ];
Tc_error_15  = [ 9.515259e+00 ; 8.722643e+00 ; 9.419623e+00 ];

%-- Image #16:
omc_16 = [ -5.649254e-01 ; -8.063252e-01 ; 1.539267e+00 ];
Tc_16  = [ -7.091650e+02 ; 9.932255e+01 ; 1.749388e+03 ];
omc_error_16 = [ 7.940438e-03 ; 8.323556e-03 ; 2.571866e-03 ];
Tc_error_16  = [ 1.069595e+01 ; 9.936152e+00 ; 1.133063e+01 ];

%-- Image #17:
omc_17 = [ -1.772799e-01 ; -5.930978e-01 ; 1.597569e+00 ];
Tc_17  = [ -3.379820e+02 ; 1.131432e+02 ; 1.803552e+03 ];
omc_error_17 = [ 8.363009e-03 ; 8.126975e-03 ; 1.824982e-03 ];
Tc_error_17  = [ 1.086181e+01 ; 9.972851e+00 ; 1.096304e+01 ];

%-- Image #18:
omc_18 = [ -3.336081e-01 ; -7.178728e-01 ; 1.590361e+00 ];
Tc_18  = [ -3.604301e+01 ; 1.096562e+02 ; 1.570308e+03 ];
omc_error_18 = [ 6.873200e-03 ; 6.774340e-03 ; 2.179440e-03 ];
Tc_error_18  = [ 9.181885e+00 ; 8.653144e+00 ; 8.147502e+00 ];

%-- Image #19:
omc_19 = [ -4.839635e-01 ; -7.437227e-01 ; 1.553154e+00 ];
Tc_19  = [ -2.349957e+02 ; 4.980857e+01 ; 1.337178e+03 ];
omc_error_19 = [ 6.804492e-03 ; 6.585122e-03 ; 2.036908e-03 ];
Tc_error_19  = [ 7.976111e+00 ; 7.405740e+00 ; 7.217870e+00 ];

%-- Image #20:
omc_20 = [ 3.839567e-01 ; 3.113719e-02 ; 1.515710e+00 ];
Tc_20  = [ 1.712484e+02 ; 5.282471e+01 ; 1.159959e+03 ];
omc_error_20 = [ 6.865989e-03 ; 7.165871e-03 ; 1.960615e-03 ];
Tc_error_20  = [ 6.701521e+00 ; 6.458082e+00 ; 7.057016e+00 ];

