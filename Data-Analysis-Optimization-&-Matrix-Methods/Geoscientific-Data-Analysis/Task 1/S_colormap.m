% for S colromap (90x110 matrix)
% first change the grid scale from meters to kilometers (80/1000)
load("HW1.mat");
grid_old = 80;
[x_km, y_km] = meshgrid((1:size(S, 2))*(grid_old / 1000), (1:size(S, 1))*(grid_old / 1000));
% disply S
imagesc( x_km(1,:), y_km(:, 1), S);
colormap("jet");
colorbar;
xlabel('x (km)');
ylabel('y (km)');
title('Silver Quantity (S)');
%calculating the max and min 
S_max = max(S(:));
S_min = min(S(:));
% show the results 
fprintf('S Maximum: %.2f meters\n', S_max);
fprintf('S Minimum: %.2f meters\n', S_min);
% mean and median 
S_mean = mean(S(:));
S_median = median(S(:));
% show results 
fprintf('S Mean: %.2f meters\n', S_mean);
fprintf('S Median: %.2f meters\n', S_median);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%S Maximum: 4.78 meters
%S Minimum: 0.00 meters
%S Mean: 2.35 meters
%S Median: 2.35 meters