
% for T colromap (90x110 matrix)
% first change the grid scale from meters to kilometers (80/1000)
load("HW1.mat");
grid_old = 80;
[x_km, y_km] = meshgrid((1:size(T, 2))*(grid_old / 1000), (1:size(T, 1))*(grid_old / 1000));
% disply T
imagesc( x_km(1,:), y_km(:, 1), T);
colormap("jet");
colorbar;
xlabel('x (km)');
ylabel('y (km)');
title('Topography (T)');
%calculating the max and min 
T_max = max(T(:));
T_min = min(T(:));
% show the results 
fprintf('T Maximum: %.2f meters\n', T_max);
fprintf('T Minimum: %.2f meters\n', T_min);
% mean and median 
T_mean = mean(T(:));
T_median = median(T(:));
% show results 
fprintf('T Mean: %.2f meters\n', T_mean);
fprintf('T Median: %.2f meters\n', T_median);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%from the code calculations 
%the max elevation value = 578.18 m
%the min elevation value = 86.20 m
%T mean = 230.36 m
%T median = 220.46 m
%both the mean and median are very close with difference of 9.9, which means that T distribution is clode to normal 
