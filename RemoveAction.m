% this function takes the first RGB pixels of each of the given images,
% applies the median function and then replaces the new pixel in an array
% inputs: image cell array containing RGB values for each of the images
% outputs: median filtered RGB image array

function[Removed_Action] = RemoveAction(image_array)
% find dimensions of image
[rows, columns, layer] = size(image_array{1});

% pre-allocation
r_pixel = zeros(1, length(image_array));
g_pixel = zeros(1, length(image_array));
b_pixel = zeros(1, length(image_array));

% for every pixel in the image
for r = 1:rows
    for c = 1:columns
        % for every RGB pixel in each photo apply the median filter
        for i = 1:length(image_array)
            r_pixel(i) = image_array{i}(r, c, 1);
            g_pixel(i) = image_array{i}(r, c, 2);
            b_pixel(i) = image_array{i}(r, c, 3);
        end
        
        % convert RGB input into correct format
        rgb_input(:,:,1) = r_pixel;
        rgb_input(:,:,2) = g_pixel;
        rgb_input(:,:,3) = b_pixel;
        % find median of these values
        [r_med, g_med, b_med] = MedianPixel(rgb_input);
        
        % convert values into uint8 and store in array
        Removed_Action(r, c, 1) = uint8(r_med);
        Removed_Action(r, c, 2) = uint8(g_med);
        Removed_Action(r, c, 3) = uint8(b_med);
    end
end