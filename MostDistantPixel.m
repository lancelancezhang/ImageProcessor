% this function calculates the most distant pixel in the RGB input of the
% images from the median RGB pixel of the same images
% inputs: matrix containing RGB value of a pixel in each image
% outputs: most distant R, G, B pixels from the median pixels

function[Most_Distant_r, Most_Distant_g, Most_Distant_b] = MostDistantPixel(input_matrix)
% input_matrix = rgb_input
list_distance = zeros(1, length(input_matrix)); % pre-allocation optimisation

% calculate the median RGB of the input_matrix
[r_med, g_med, b_med] = MedianPixel(input_matrix);
% append the median values into an array
rgb_med = [r_med, g_med, b_med];
% find dimensions of the input matrix
[rows, columns, layer] = size(input_matrix);
position = 0;
% for 1x1x3 case only one possible RGB combination
if columns == 1
    Most_Distant_r = input_matrix(1, 1, 1);
    Most_Distant_g = input_matrix(1, 1, 2);
    Most_Distant_b = input_matrix(1, 1, 3);
    
% for 1xnx3 n>1 case
elseif columns > 1
    % for each pixel in the input_matrix
    for a = 1:columns
        point = [0, 0, 0]; % pre-allocation optimisation
        for b = 1:3
            point(b) = input_matrix(1, a, b);
        end
        % find distance between median pixel and other pixels
        [Distance] = PixelDistance(rgb_med, point);
        % append distance into a list
        list_distance(a) = Distance;
    end
    
    % find indexed position of the maximum distance
    position = find(list_distance == max(list_distance));
    [row_pos, col_pos] = size(position);
    if col_pos > 1
        position = position(1);
    end
    
    % append most distant pixel into an array
    Most_Distant_r = input_matrix(1,position,1);
    Most_Distant_g = input_matrix(1,position,2);
    Most_Distant_b = input_matrix(1,position,3);
end