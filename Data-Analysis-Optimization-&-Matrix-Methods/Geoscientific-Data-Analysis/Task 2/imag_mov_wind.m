%using the operator on the image 
windowsize_2 = [20,20];
[img_mean, img_std]= MvngWindOpert(im6, windowsize_2);
figure(23);
subplot(2,1,1);
imshow(img_mean, []);
title('Moving window means for the image', 'fontsize', 10);
ylabel('y(m)');
hcb=colorbar;
ylabel(hcb,'moving window means (m)')


subplot(2,1,2);
imshow(img_std, []);
grid on;
title('Moving window stds for the image ', 'FontSize', 10);
xlabel('x(m)');
ylabel('y(m)');
hcb=colorbar;
ylabel(hcb,'moving window stds (m)')

colormap('jet');

%proportionality effect 
figure(24)
scatter(img_mean, img_std, 'Marker','o');
title('Moving windows means vs stds for the image ')
xlabel('Mean (m)')
ylabel('Std (m)')
%corelation coefficient 
corrcoef_image = corrcoef(img_mean, img_std);
fprintf('corrcoef_image: %.4f\n', corrcoef_image(1,2))

%for the correlogram
%I created a function to calculate h_scatterplot
[imgo1,imgl1]= lag_scatterplots(im6,1, 1); %h=(1,2)
[imgo2,imgl2]= lag_scatterplots(im6,1, 2);
[imgo3,imgl3]= lag_scatterplots(im6,1, 3);
[imgo4,imgl4]= lag_scatterplots(im6,1, 4);
[imgo5,imgl5]= lag_scatterplots(im6,1, 5);
[imgo6,imgl6]= lag_scatterplots(im6,1, 6);
[imgo7,imgl7]= lag_scatterplots(im6,1, 7);
[imgo8,imgl8]= lag_scatterplots(im6,1, 8);
[imgo9,imgl9]= lag_scatterplots(im6,1, 9);
[imgo10,imgl10]= lag_scatterplots(im6,2, 1);
[imgo11,imgl11]= lag_scatterplots(im6,2, 2);
[imgo12,imgl12]= lag_scatterplots(im6,2, 3);
[imgo13,imgl13]= lag_scatterplots(im6,2, 4);
[imgo14,imgl14]= lag_scatterplots(im6,2, 5);
[imgo15,imgl15]= lag_scatterplots(im6,2, 6);
[imgo16,imgl16]= lag_scatterplots(im6,2, 7);
[imgo17,imgl17]= lag_scatterplots(im6,2, 8);
[imgo18,imgl18]= lag_scatterplots(im6,2, 9);
[imgo19,imgl19]= lag_scatterplots(im6,3, 1);
[imgo20,imgl20]= lag_scatterplots(im6,3, 2);
[imgo21,imgl21]= lag_scatterplots(im6,3, 3);
[imgo22,imgl22]= lag_scatterplots(im6,3, 4);
[imgo23,imgl23]= lag_scatterplots(im6,3, 5);
[imgo24,imgl24]= lag_scatterplots(im6,3, 6);
[imgo25,imgl25]= lag_scatterplots(im6,3, 7);
[imgo26,imgl26]= lag_scatterplots(im6,3, 8);
[imgo27,imgl27]= lag_scatterplots(im6,3, 9);
[imgo28,imgl28]= lag_scatterplots(im6,4, 1);
[imgo29,imgl29]= lag_scatterplots(im6,4, 2);
[imgo30,imgl30]= lag_scatterplots(im6,4, 3);
[imgo31,imgl31]= lag_scatterplots(im6,4, 4);
[imgo32,imgl32]= lag_scatterplots(im6,4, 5);
[imgo33,imgl33]= lag_scatterplots(im6,4, 6);
[imgo34,imgl34]= lag_scatterplots(im6,4, 7);
[imgo35,imgl35]= lag_scatterplots(im6,4, 8);
[imgo36,imgl36]= lag_scatterplots(im6,4, 9);
AA={imgo1, imgo2,imgo3,imgo4,imgo5,imgo6,imgo7,imgo8,imgo9,imgo10,imgo11,imgo12,imgo13,imgo14,imgo15,imgo16,imgo17,imgo18,imgo19,imgo20,imgo21,imgo22,imgo23,imgo24,imgo25,imgo26,imgo27,imgo28,imgo29,imgo30,imgo31,imgo32,imgo33,imgo34,imgo35,imgo36};
BB={imgl1, imgl2, imgl3, imgl4,imgl5,imgl6,imgl7,imgl8,imgl9,imgl10,imgl11,imgl12,imgl13,imgl14,imgl15,imgl16,imgl17,imgl18,imgl19,imgl20,imgl21,imgl22,imgl23,imgl24,imgl25,imgl26,imgl27,imgl28,imgl29,imgl30,imgl31,imgl32,imgl33,imgl34,imgl35,imgl36};
h_img=[1 1; 1 2; 1 3; 1 4; 1 5;1 6; 1 7; 1 8; 1 9; 2 1; 2 2; 2 3; 2 4; 2 5; 2 6; 2 7; 2 8; 2 9; 3 1; 3 2; 3 3; 3 4; 3 5; 3 6; 3 7; 3 8; 3 9; 4 1; 4 2; 4 3; 4 4; 4 5; 4 6; 4 7; 4 8; 4 9];
num_points = size(h_img, 1);
hyp_h_img = [];
for i= 1:num_points
    x = h_img(i,1);
    y = h_img(i,2);
    hyp_h_img(end+1) = hypot(x,y);
end 
%calculate the correlation coefficient 
A_img={};
B_img={};

co_cofs_img= zeros(1, numel(AA));
for i = 1:numel(AA)
    calacu_co_img=corrcoef(AA{i},BB{i});
    co_cofs_img(i)=calacu_co_img(1,2);
end 
figure(25)
scatter(hyp_h_img , co_cofs_img,'filled', 'marker', 'o', 'MarkerEdgeColor', 'b'); hold on;
xlabel('|h|');
ylabel('\rho (h)');
title ('correlogram for the image'); hold off;
%%corrcoef_image: 0.0183

