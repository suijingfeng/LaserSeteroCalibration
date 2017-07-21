%%% This script load the point cloud files into memory 
% loadpcdfiles
% Checks that if there are some PCD in the directory:
list_pcd = dir('*.pcd');
size_pcd = size(list_pcd, 1);

if size_pcd < 1
    fprintf(1,'No *.pcd in this directory, change directory and try again.\n');
    return;
end;
    
% IF yes, display the directory content:
dir;
baseName = '0';
while baseName == '0'
    baseName = input('Basename of laser calibration files (without number nor suffix): ','s');
    if isempty(baseName)
   		return;
    end   
end

LaserPlanesParas = [];
LaserPlanesNormals = [];
allPlanesLaserPoints = cell(1,size_pcd);
maxDistance = 0.01;
i = 1;
while (i <= size_pcd) 
    pcd_name = list_pcd(i).name;
    if ~isempty(strfind(pcd_name, baseName) )
        ptCloud = pcread(pcd_name);
        fprintf(1,'>>>%s loaded...\n', pcd_name);
        
        % compute normals, inliers
        [model, inlierIndices, outlierIndices] = pcfitplane(ptCloud, maxDistance);
        % Ln = model.Parameters(1,4)*model.Normal'
        OnePlaneInliers = select(ptCloud, inlierIndices);
        % Store the plane coefficient
        LaserPlanesParas = [LaserPlanesParas model.Parameters'];
        LaserPlanesNormals = [LaserPlanesNormals model.Normal'];
        % Store the inliers points
        allPlanesLaserPoints{1, i} = OnePlaneInliers.Location;
        eval(['L_' num2str(i) ' = OnePlaneInliers;']);
    else
        disp('Have different filenames, delete it and try again!');
    end;         
   i = i+1;
end

%% test
% [LaserPlanesPoint,segLen,totalPoints] = OrganizeLaserPlanePoints(allPlanesPoints);