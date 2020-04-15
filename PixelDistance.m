% this function measures the distance between two points in 3D space
% Inputs: two points in RGB colour space
% Output: square distance value between the two points in 3D colour space

function[square_d] = PixelDistance(point1, point2)
% find dimensions of the point stored in array to classify array type
dimensions = size(point1);

% doubles conversion
point1 = double(point1);
point2 = double(point2);

% for 1x3 array case find square distance
if dimensions(1) == 1 && dimensions(2) == 3
    square_d = (point1(1) - point2(1))^2 + (point1(2) - point2(2))^2 + (point1(3) - point2(3))^2;
    
% for 3x1 array case find square distance
elseif dimensions(1) == 3 && dimensions(2) == 1
    square_d = (transpose(point1(1)) - transpose(point2(1)))^2 + transpose((point1(2)) - transpose(point2(2)))^2 + (transpose(point1(3)) - transpose(point2(3)))^2;
    
% for 1x1x3 array case
elseif dimensions(1) == 1 && dimensions(2) == 1
    square_d = (point1(1,1,1) - point2(1,1,1))^2 + (point1(1,1,2) - point2(1,1,2))^2 + (point1(1,1,3) - point2(1,1,3))^2;
end
