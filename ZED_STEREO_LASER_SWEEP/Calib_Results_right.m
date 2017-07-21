% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly excecuted under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 699.867750214437478 ; 699.357067984456876 ];

%-- Principal point:
cc = [ 672.503590564672209 ; 360.345867010916720 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.172462825886032 ; 0.025057932701290 ; 0.000356106920696 ; 0.000123711215068 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 3.867041862691929 ; 3.949398831531380 ];

%-- Principal point uncertainty:
cc_error = [ 3.990876876125770 ; 3.864609778611412 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.004331454830090 ; 0.003720475049002 ; 0.000708157413579 ; 0.000532123778875 ; 0.000000000000000 ];

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
omc_1 = [ -7.280299e-01 ; -3.687772e-01 ; 1.401696e+00 ];
Tc_1  = [ -2.533321e+02 ; 8.592945e+01 ; 1.384294e+03 ];
omc_error_1 = [ 7.429227e-03 ; 7.483355e-03 ; 2.169881e-03 ];
Tc_error_1  = [ 8.112670e+00 ; 7.661107e+00 ; 6.733290e+00 ];

%-- Image #2:
omc_2 = [ -7.368522e-02 ; -8.167766e-02 ; 1.574872e+00 ];
Tc_2  = [ 3.377730e+02 ; 6.853547e+01 ; 1.337581e+03 ];
omc_error_2 = [ 8.124328e-03 ; 8.325397e-03 ; 1.137506e-03 ];
Tc_error_2  = [ 7.574898e+00 ; 7.435996e+00 ; 7.742219e+00 ];

%-- Image #3:
omc_3 = [ -2.079219e-01 ; 7.973336e-01 ; 1.620726e+00 ];
Tc_3  = [ 5.355537e+02 ; 1.677603e+02 ; 1.393015e+03 ];
omc_error_3 = [ 8.380640e-03 ; 7.951609e-03 ; 2.146818e-03 ];
Tc_error_3  = [ 7.986614e+00 ; 8.006342e+00 ; 8.207016e+00 ];

%-- Image #4:
omc_4 = [ -2.480102e-01 ; -9.578210e-02 ; 1.551113e+00 ];
Tc_4  = [ -1.365175e+02 ; 7.162964e+01 ; 1.439515e+03 ];
omc_error_4 = [ 1.100690e-02 ; 1.064774e-02 ; 1.904289e-03 ];
Tc_error_4  = [ 8.279397e+00 ; 7.945471e+00 ; 8.719909e+00 ];

%-- Image #5:
omc_5 = [ -2.037243e-01 ; -1.687668e-01 ; 1.562152e+00 ];
Tc_5  = [ 7.227148e+02 ; 6.605926e+01 ; 1.476869e+03 ];
omc_error_5 = [ 6.581677e-03 ; 7.822703e-03 ; 1.770762e-03 ];
Tc_error_5  = [ 8.451338e+00 ; 8.602807e+00 ; 8.968984e+00 ];

%-- Image #6:
omc_6 = [ -4.643672e-01 ; -3.022149e-01 ; 1.505971e+00 ];
Tc_6  = [ -5.124656e+02 ; 7.058467e+01 ; 2.232048e+03 ];
omc_error_6 = [ 1.764916e-02 ; 1.796581e-02 ; 4.165989e-03 ];
Tc_error_6  = [ 1.327142e+01 ; 1.241900e+01 ; 1.291767e+01 ];

%-- Image #7:
omc_7 = [ -5.086832e-02 ; 1.906326e-01 ; 2.334944e+00 ];
Tc_7  = [ 7.837900e+02 ; 1.430975e+02 ; 1.429561e+03 ];
omc_error_7 = [ 1.032700e-02 ; 1.058902e-02 ; 1.197341e-03 ];
Tc_error_7  = [ 8.303122e+00 ; 8.292342e+00 ; 9.567628e+00 ];

%-- Image #8:
omc_8 = [ 6.220594e-01 ; 9.311908e-02 ; 1.452092e+00 ];
Tc_8  = [ 6.829584e+02 ; 1.105613e+02 ; 8.658707e+02 ];
omc_error_8 = [ 7.006164e-03 ; 7.244592e-03 ; 3.145452e-03 ];
Tc_error_8  = [ 5.144099e+00 ; 5.374712e+00 ; 8.006833e+00 ];

%-- Image #9:
omc_9 = [ 4.437323e-01 ; 9.742340e-02 ; 1.517463e+00 ];
Tc_9  = [ 4.764918e+02 ; 8.712776e+01 ; 1.000806e+03 ];
omc_error_9 = [ 6.622566e-03 ; 7.152402e-03 ; 2.164387e-03 ];
Tc_error_9  = [ 5.863239e+00 ; 5.789750e+00 ; 6.783067e+00 ];

%-- Image #10:
omc_10 = [ 9.127809e-01 ; 4.293127e-01 ; 1.307137e+00 ];
Tc_10  = [ 1.580361e+02 ; 1.083518e+02 ; 1.239030e+03 ];
omc_error_10 = [ 6.579662e-03 ; 5.890814e-03 ; 3.501059e-03 ];
Tc_error_10  = [ 7.088625e+00 ; 6.938767e+00 ; 8.017985e+00 ];

%-- Image #11:
omc_11 = [ 5.988344e-01 ; 7.457845e-02 ; 1.464755e+00 ];
Tc_11  = [ 3.180665e+02 ; 1.114570e+02 ; 9.679389e+02 ];
omc_error_11 = [ 6.416749e-03 ; 6.455521e-03 ; 2.517069e-03 ];
Tc_error_11  = [ 5.583142e+00 ; 5.495992e+00 ; 6.319958e+00 ];

%-- Image #12:
omc_12 = [ -9.987614e-03 ; -2.818795e-01 ; 1.582970e+00 ];
Tc_12  = [ 3.237792e+02 ; 8.109984e+01 ; 1.084683e+03 ];
omc_error_12 = [ 6.267868e-03 ; 6.684593e-03 ; 1.424773e-03 ];
Tc_error_12  = [ 6.112505e+00 ; 6.078028e+00 ; 6.154052e+00 ];

%-- Image #13:
omc_13 = [ 3.084107e-01 ; -8.306083e-02 ; 1.545241e+00 ];
Tc_13  = [ 1.094627e+02 ; 9.302555e+01 ; 1.214192e+03 ];
omc_error_13 = [ 7.004332e-03 ; 6.709935e-03 ; 1.834545e-03 ];
Tc_error_13  = [ 6.952226e+00 ; 6.738383e+00 ; 7.276941e+00 ];

%-- Image #14:
omc_14 = [ -2.624904e-03 ; -5.165558e-01 ; 1.597306e+00 ];
Tc_14  = [ -1.763324e+02 ; 1.095850e+02 ; 1.062334e+03 ];
omc_error_14 = [ 7.244731e-03 ; 6.397529e-03 ; 1.598672e-03 ];
Tc_error_14  = [ 6.244377e+00 ; 5.884414e+00 ; 6.531380e+00 ];

%-- Image #15:
omc_15 = [ -3.325922e-01 ; -5.681802e-01 ; 1.567699e+00 ];
Tc_15  = [ -4.383779e+02 ; 8.011192e+01 ; 1.581826e+03 ];
omc_error_15 = [ 8.628860e-03 ; 8.626149e-03 ; 1.910560e-03 ];
Tc_error_15  = [ 9.419804e+00 ; 8.840968e+00 ; 9.917810e+00 ];

%-- Image #16:
omc_16 = [ -5.499373e-01 ; -8.099783e-01 ; 1.536966e+00 ];
Tc_16  = [ -8.148566e+02 ; 8.283593e+01 ; 1.751537e+03 ];
omc_error_16 = [ 8.427918e-03 ; 8.751534e-03 ; 2.641748e-03 ];
Tc_error_16  = [ 1.066189e+01 ; 1.012200e+01 ; 1.167834e+01 ];

%-- Image #17:
omc_17 = [ -1.686758e-01 ; -5.950490e-01 ; 1.594486e+00 ];
Tc_17  = [ -4.458168e+02 ; 9.657028e+01 ; 1.808342e+03 ];
omc_error_17 = [ 8.692643e-03 ; 8.452494e-03 ; 1.825911e-03 ];
Tc_error_17  = [ 1.076961e+01 ; 1.009190e+01 ; 1.130857e+01 ];

%-- Image #18:
omc_18 = [ -3.213205e-01 ; -7.220367e-01 ; 1.587219e+00 ];
Tc_18  = [ -1.449224e+02 ; 9.500937e+01 ; 1.570522e+03 ];
omc_error_18 = [ 7.208837e-03 ; 6.946706e-03 ; 2.051349e-03 ];
Tc_error_18  = [ 9.139934e+00 ; 8.681332e+00 ; 8.121065e+00 ];

%-- Image #19:
omc_19 = [ -4.728005e-01 ; -7.458554e-01 ; 1.549588e+00 ];
Tc_19  = [ -3.459555e+02 ; 3.739685e+01 ; 1.338929e+03 ];
omc_error_19 = [ 7.085804e-03 ; 6.768538e-03 ; 1.930238e-03 ];
Tc_error_19  = [ 7.949029e+00 ; 7.488106e+00 ; 7.560312e+00 ];

%-- Image #20:
omc_20 = [ 3.943819e-01 ; 2.725257e-02 ; 1.514840e+00 ];
Tc_20  = [ 5.913734e+01 ; 4.175816e+01 ; 1.159529e+03 ];
omc_error_20 = [ 6.914497e-03 ; 6.643810e-03 ; 1.981829e-03 ];
Tc_error_20  = [ 6.608637e+00 ; 6.455428e+00 ; 6.967710e+00 ];

