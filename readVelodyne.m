%%% This script alets the user enter the name of the point cloud files 
%(base name, numbering scheme, suffix, ...

      
% Checks that there are some PCD in the directory:
l_pcd = dir('*.pcd');
s_pcd = size(l_pcd, 1);

if s_pcd < 1
    fprintf(1,'No *.pcd in this directory, change directory and try again.\n');
    return;
end;
    
% IF yes, display the directory content:
dir;
baseName = '0';
format_pc = '0'; % .pcd or .ply or .txt

while baseName == '0'
    baseName = input('Basename laser calibration files (without number nor suffix): ','s');
    if isempty(baseName)
   		return;
    end   
end

while format_pc == '0'
    format_pc = input('Point cloud format: ([]=''d''=''pcd'', ''y''=''ply'')', 's');
		
    if lower(format_pc(1)) == 'd'
        format_pc = 'pcd';
    elseif lower(format_pc(1)) == 'y'
        format_pc = 'ply';
    elseif lower(format_pc(1)) == 't'
        format_pc = 'txt';
    else
        disp('Invalid image format');
        return;
    end
end

%% check laserfile is valid

laserFile = dir([baseName '*']);
NumCandidate = size(laserFile, 1);
    
ind_valid = [];
pointcloud_extension = [];
LaserNameIsValid = 0;
length_name = size(baseName, 2);

if NumCandidate > 0
    for i = 1:NumCandidate
        filenamepp = laserFile(i).name;
        if isempty(baseName)
            iii = 1;
        else
            iii = strfind(filenamepp, baseName);
        end;

        loc_ext = strfind(filenamepp, format_pc);
        string_num = filenamepp(length_name+1:loc_ext-2);

        if isempty(str2num(string_num))
            iii = [];
            disp('string_number is empty!');
            return;
        end;

        if ~isempty(iii) && ~isempty(loc_ext)
            LaserNameIsValid = LaserNameIsValid + 1;
            ind_valid = [ind_valid i];
            pointcloud_extension = [pointcloud_extension loc_ext(1)];
        end;
    end;
end
  
if (LaserNameIsValid==0) 
    fprintf(1,'No image found. File format may be wrong.\n');
else
    % Get all the string numbers:
    string_length = zeros(1, LaserNameIsValid);
    indices =  zeros(1, LaserNameIsValid);
            
    for ppp = 1:LaserNameIsValid
        name = laserFile(ind_valid(ppp)).name;
        string_num = name(length_name+1:pointcloud_extension(ppp) - 2);
        string_length(ppp) = size(string_num,2);
        indices(ppp) = str2num(string_num);
    end;
            
    % Number of .PCDs...
    first_num = min(indices);
    n_ima = max(indices) - first_num + 1;
end;
    

no_image_file = 0;

i = 1;
LaserNormals = [];
LaserOriginDistance = [];
maxDistance = 0.03;

while (i <= n_ima) 
    pcd_name = l_pcd(i).name;
    if exist(pcd_name, 'file')
        ptCloud = pcread(pcd_name);
        fprintf(1,'>>>%s loaded...\n', pcd_name);
        
        % compute normals, inliers
        [model, inlierIndices, outlierIndices] = pcfitplane(ptCloud, maxDistance);
        %Ln = model.Parameters(1,4)*model.Normal'
        if model.Parameters(1,4) > 0
            LaserOriginDistance = [LaserOriginDistance; model.Parameters(1,4)];
            LaserNormals=[LaserNormals;model.Normal];
        else
            LaserOriginDistance = [LaserOriginDistance; -model.Parameters(1,4)];
            LaserNormals=[LaserNormals;-model.Normal];
        end
        plane = select(ptCloud, inlierIndices);
        eval(['L_' num2str(i) ' = plane;']);
    end;         
   i = i+1;
end

cameraNormals = GetCameraPlanes2('Calib_Results.mat');
cameraNormals = cameraNormals';
cameraOrignDis = sqrt(sum(cameraNormals.^2,2)) ./1000;
TT = (LaserNormals' * LaserNormals)\LaserNormals' * (cameraOrignDis - LaserOriginDistance)

