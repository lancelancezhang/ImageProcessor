% this function calculates the median number in each of the colour
% layers and stores them in the respective RGB output variable
% Input: colour matrix for RGB layer
% Output: median RGB variables

function[med_r, med_g, med_b] = MedianPixel(colour_matrix)
% take the median of each layer - r, g, b
med_r = median(colour_matrix(:, :, 1));
med_g = median(colour_matrix(:, :, 2));
med_b = median(colour_matrix(:, :, 3));

