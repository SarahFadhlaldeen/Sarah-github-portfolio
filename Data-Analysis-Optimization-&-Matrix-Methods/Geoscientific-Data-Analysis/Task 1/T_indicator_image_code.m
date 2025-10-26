% T indicator image 
%initialize an all white image
indicator_image = ones(size(T));
% black is indicated by (0), set the area above 200 to 0 
indicator_image (T > 200) = 0;
%show the image 
imshow(indicator_image, 'Colormap', [1, 1, 1; 0, 0, 0]);
title('Elevation T indicator image ')