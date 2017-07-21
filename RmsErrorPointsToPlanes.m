function RmsError = RmsErrorPointsToPlanes(var, Lpts, LsrSegLen, Nc, Dc)

% INPUTS:
%   Lpts:      3xN vector containing all the laser board points.
%   LsrSegLen: Mx1 vector containing the scan numbers of the laser points.
%   Nc: M*3 vector containing the normals of chessboard in camera frame.
%   Dc: Mx1 distance vector of camera origin to chessboard

% OUTPUTS:
%     RmsError: root mean squares of errors.
if(size(Lpts, 2) == 3)
    Lpts = Lpts';
end

R = rodrigues(var(1:3));
t = var(4:6);

%pre-allocate memory
allPoints = size(Lpts, 2);
NC = zeros(3, allPoints);
DC = zeros(1, allPoints);
index = 1;
endPos = 0;

for i=1:length(LsrSegLen)
   endPos = endPos + LsrSegLen(i);
   NC(1:3, index:endPos) = repmat(Nc(i, :)', 1, LsrSegLen(i));
   DC(1, index:endPos) = repmat(Dc(i,:), 1, LsrSegLen(i));
   index = endPos+1;
end
%                 3*N  3x3*3xN + 3*1
errorvec = dot(NC, (R*Lpts + t)) - DC;
RmsError = sqrt( sum(errorvec.^2)/length(errorvec) );
