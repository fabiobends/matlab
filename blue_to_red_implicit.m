function new_image = blue_to_red_implicit(filename)
if nargin == 0, filename = 'bluebird_photo.jpg'; end
% Logical indexing for this problem requires separating pages of array:
input_image = imread(filename);
new_image_red   = input_image(:,:,1);
new_image_green = input_image(:,:,2);
new_image_blue  = input_image(:,:,3);
new_image_mean  = mean(input_image,3);

pixels_to_change = new_image_blue > 1.2*new_image_mean;

new_image_red(pixels_to_change) = new_image_blue(pixels_to_change);
new_image_green(pixels_to_change) = 0;
new_image_blue(pixels_to_change) = 0;

% Now put array back together:
new_image(:,:,1) = new_image_red;
new_image(:,:,2) = new_image_green;
new_image(:,:,3) = new_image_blue;

