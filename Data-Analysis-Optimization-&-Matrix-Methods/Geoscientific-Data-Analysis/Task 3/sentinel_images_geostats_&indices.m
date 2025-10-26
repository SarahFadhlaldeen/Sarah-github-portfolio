%reading spectral bands 4 and 8
im_b4 = imread('T37REH_20230829T074621_B04_20m.jp2');
im_b8 = imread('T37REH_20230829T074621_B8A_20m.jp2');
im_b4_2 = double(im_b4);
im_b8_2 = double(im_b8);
NDVI = (im_b8_2-im_b4_2)./(im_b8_2+im_b4_2);

figure(12);hold on;
imagesc(NDVI);
colormap("jet");
hcb=colorbar;
ylabel(hcb,'NDVI');
axis('on','image');
xlabel('X-easting');
ylabel('Y-northing');
title('NDVI');hold off;

%% threshold 
threshold = 0.3;
q = (NDVI > threshold);
veg_perc = 100 * sum(q(:)) / numel(q);
fprintf('percentage of vegetated areas: %.2f%% \n', veg_perc);
%  percentage of vegetated areas: 0.31% 
figure(13);hold on;
imshow(q);
hcb=colorbar;
ylabel(hcb,' vegetation over the area ');
axis('on','image');
xlabel('X-easting');
ylabel('Y-northing');
title('vegetation over the area with threshold = 0.3 ');hold off;
%% histogram of q
ndvi_above_thre = NDVI(q);
figure(14); hold on;
histogram(ndvi_above_thre);
xlabel('NDVI');
ylabel('frequency');
title('NDVI values above threshold=0.3 histogram ');hold off;
%%%%%%%%%
figure(15); hold on;
imhist(ndvi_above_thre);
xlabel('NDVI');
ylabel('frequency');
title('NDVI values above threshold histogram ');hold off;
%% SAVI
L=0.5;
SAVI = ((im_b8_2-im_b4_2)./(im_b8_2+im_b4_2+L))*(1+L);
figure(16);hold on;
imagesc(SAVI);
colormap("jet");
hcb=colorbar;
ylabel(hcb,'SAVI');
axis('on','image');
xlabel('X-easting');
ylabel('Y-northing');
title('SAVI');hold off;
%% NDBI
im_b11 = imread('T37REH_20230829T074621_B11_20m.jp2');
im_b11_2 = double(im_b11);

NDBI = (im_b11_2-im_b8_2)./(im_b11_2+im_b8_2);
figure(17);hold on;
imagesc(NDBI);
colormap("jet");
hcb=colorbar;
ylabel(hcb,'NDBI');
axis('on','image');
xlabel('X-easting');
ylabel('Y-northing');
title('NDBI');hold off;
