% this function takes the first RGB values of each of the given images and
% applies the MostDistantPixel function and places new pixels in an array
% inputs: image cell array containing RGB values for each of the images
% outputs: median filtered RGB image array

function[Action_Shot] = ActionShot(image_array)
% find dimensions of image
% image_array = images;
[rows, columns, layers] = size(image_array{1});
Action_Shot = zeros(rows, columns, layers, 'uint8');

% initialise variables (pre allocation)
r_pixel = zeros(1, length(image_array));
g_pixel = zeros(1, length(image_array));
b_pixel = zeros(1, length(image_array));

% Action_Shot = zeros(rows, columns, 1);
% Action_Shot = zeros(rows, columns, 2);
% Action_Shot = zeros(rows, columns, 3);
% for every pixel in the image
for r = 1:rows
    for c = 1:columns
        % for every RGB pixel in each photo apply MostDistantPixel function
        for i = 1:length(image_array)
            r_pixel(i) = image_array{i}(r, c, 1);
            g_pixel(i) = image_array{i}(r, c, 2);
            b_pixel(i) = image_array{i}(r, c, 3);
        end
        
        % convert RGB input into correct format
        rgb_input(:,:,1) = r_pixel;
        rgb_input(:,:,2) = g_pixel;
        rgb_input(:,:,3) = b_pixel;
        % find most distant pixel of these RGB values
        [mostd_r, mostd_g, mostd_b] = MostDistantPixel(rgb_input);
        
        % convert pixels to uint8 and store in array
        Action_Shot(r, c, 1) = mostd_r;
        Action_Shot(r, c, 2) = mostd_g;
        Action_Shot(r, c, 3) = mostd_b;
    end
end
