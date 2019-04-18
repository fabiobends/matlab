function new_image = blue_to_red(filename)
if nargin == 0,filename = 'bluebird_photo.jpg';end % example default
input_image = imread(filename);
new_image = input_image;
dims = size(input_image);
for ii = 1:size(input_image,1)
   for jj = 1:size(input_image,2)
      if input_image(ii,jj,3)> 1.2*mean(input_image(ii,jj,:))
         new_image(ii,jj,1) = input_image(ii,jj,3); % copy blue to red
         new_image(ii,jj,2:3) = 0; 
      end
   end
end

        