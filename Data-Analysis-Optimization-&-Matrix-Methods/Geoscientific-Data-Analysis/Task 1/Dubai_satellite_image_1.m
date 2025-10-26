% Read image (your file will have a different name)
im = imread('T39RZH_20230915T064629_TCI_10m.jp2');
% Cut out a 3000x3000 pixel subset
im2 = im(5001:8000,3001:6000,:);
% Display
figure; imagesc(im2); grid on;
% Select a 1000x1000 pixel image, the values
im3 = im2(1601:2600,1201:2200,:);
% Change from uint8 to double precision, make a gray scale image, values between 0-1
im4 = double(im3);
im5 = sum(im4,3)/(3*255);
%Now display, maybe adjust colorscale
figure; imagesc(im5); colormap("gray");
caxis([0 0.6]);