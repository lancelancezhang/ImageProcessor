% this function reads in a list of images from a directory, and stores each
% image's RGB data in a cell array where each element is a 3D array
% inputs: directory name and array containing image names
% outputs: cell array containing RGB data for each image

function[pics] = ReadImages(path, filenames)
% format path directory name
path = sprintf('%s%s', path, '\');

% cycle through each of the file names
for i = 1:length(filenames)
    % open specified image under specified path
    directory = dir([path filenames{i}]);
    % store RGB data to cell array
    pics{i} = imread([path directory(1).name]);
end
