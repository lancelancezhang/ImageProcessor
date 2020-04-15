% this function scans a specified path for a file extension type and
% appends all files with that extension into a cell array
% Inputs: directory path and file extension
% Output: cell array containing files with specified extension from path

function[file_list] = GenerateImageList(path, extension)
% format path directory name
path = sprintf('%s%s', path, '\');
% format image_extension variable to be used in dir function
formatted_extension = sprintf('*%s', extension);

% find specific files with given directory path and extension
directory = dir([path formatted_extension]);

% find dimensions of directory array
[rows] = size(directory);

% get each file name from directory
for i = 1:rows
    file_and_directory = ([path directory(i).name]);
    % remove directory from file name string and append to cell array
    file_list{i} = file_and_directory(length(path)+1:length(file_and_directory));
end

