% Read image (your file will have a different name)
im = imread('T37REH_20181228T075329_TCI.jp2');
% Cut out a 3000x3000 pixel subset
im2 = im(5001:8000,3001:6000,:);
% Display
figure; imagesc(im2); grid on;
% Select a 1000x1000 pixel image, the values
im3 = im2(2301:3000,1901:2900,:); %here I adjusted the values because only the desert were showing
% Change from uint8 to double precision, make a gray scale image, values between 0-1
im4 = double(im3);
im5 = sum(im4,3)/(3*255);
%Now display, maybe adjust colorscale
figure; imagesc(im5); colormap("gray");
caxis([0 0.6]);
% to make the surface features more easier to recognize
im6 = imadjust(im5,stretchlim(im5));
imshow(im6);
axis('on','image')
xlabel('X-easting')
ylabel('Y-northing')
%%%%%%%%%%%%
% The satellite images I found for my city (Madinah) were very large includes the city and the dessert around it,
%so cutting a subset is not showing that much of the city, here you can see
%part of the outskirts of the city, and desert topography(I am not sure if they are mountains)
%%%%%%%%%%%%%%
%the histogram 
%imhist(im6);
%title('Histogram of the values in the image');
im6_mean = mean(im6(:));
im6_median = median(im6(:)); 
im6_mode = mode(im6(:)); 
fprintf('im6 Mean: %.2f \n', im6_mean);
fprintf('im6 Median: %.2f \n', im6_median);
fprintf('im6 Mode: %.2f \n', im6_mode);
% the histogram appears more close to normal than skewed, the computed
% values of the mean= 0.48 and meadian= 0.45 are very close to each other, also the
% computed mode value = 1 is close to them too, which satisfies the normal
% distribution more than skewed (for normal distributio mean=median=mode).