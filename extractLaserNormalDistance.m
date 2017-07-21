function [nl, dl] = extractLaserNormalDistance(LidarPlanes)
% pre-allocate memory
N = size(LidarPlanes, 2);
nl=zeros(N, 3); % Normals(Nl) N*3 of plane in laser frame
dl=zeros(N, 1); % Distance(Dl)N*1 to plane in laser frame

for i = 1:N
    if LidarPlanes(4, i) > 0
        dl(i, 1) = LidarPlanes(4, i);
        nl(i, 1:3) = -LidarPlanes(1:3, i)';
    else
         dl(i, 1) = -LidarPlanes(4, i);
         nl(i, 1:3) = LidarPlanes(1:3, i)';
    end
end