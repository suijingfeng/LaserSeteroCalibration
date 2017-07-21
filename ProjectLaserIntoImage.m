function ProjectLaserIntoImage(im, pc, delta, phi, f, c, k, alpha )
% reprojects the laser points onto the image.
% 
% INPUTS:
%     im: the image selected for reprojection.
%     pc: laser data.
%     delta: translation 3x1 vector of the laser-camera calibration.
%     phi: rotation 3x3 matrix of the laser-camera calibraion.
%     f: focal length vector (from camera calibration).
%     c: principal point vector (from camera calibration).
%     k: distortion vector (from camera calibration).
%     alpha: skew coefficient (from camera calibration).
%% Get points

% change to mm (camera parameters in mm)
Lpts = pc.Location';
delta = delta;

% apply laser to camera transformation
Cpts=phi*Lpts+repmat(delta, 1, size(Lpts, 2));

phi
delta

xc=Cpts(1,:);
yc=Cpts(2,:);
zc=Cpts(3,:);

%normalise over Z (in this frame);
a=xc./zc;
b=yc./zc;

% add distortion

r = sqrt(a.^2 + b.^2);

ad = a.*(1 + k(1).*r.^2 + k(2).*r.^4 + k(5).*r.^6) +  2.*k(3).*a.*b + k(4).*(r.^2 + 2.*a.^2);
bd = b.*(1 + k(1).*r.^2 + k(2).*r.^4 + k(5).*r.^6) +  k(3).*(r.^2 + 2.*b.^2) + 2.*k(4).*a.*b;


% image coordinates
x = f(1).*(ad + alpha.*bd) + c(1) + 1; % add 1 for matlab coords
y = f(2).*bd + c(2) + 1; % add 1 for matlab coords

%get only pixels within the image
validindices=find(x<=size(im, 2) & x>0 & y<=size(im,1) & y>0);
% invind=x>size(im,2) | x<1 | y>size(im,1) | y<1;
px=x(validindices);
py=y(validindices);
%% Display

figure;
imshow(im, []);
hold on;
%c=lines(length(px));
scatter(px,py,10,'blue','filled');
imwrite(im, '../results/reim.png')
%ellipse(2.*perrorx,2.*perrory,zeros(size(x)),px,py,c);


