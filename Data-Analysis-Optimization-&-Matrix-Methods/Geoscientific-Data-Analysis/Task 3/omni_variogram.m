X_meters = X*1000; %from km to m
Y_meters = Y*1000;
coordinates = [X_meters, Y_meters];
distances = pdist(coordinates);

% Define distance lag bins
bin_width = 1;  % Adjust the bin width as needed
bins = 0:bin_width:max(distances);

% Initialize arrays for storing gamma and counts
gamma = zeros(size(bins));
counts = zeros(size(bins));

% Calculate the variogram for each distance lag
for i = 1:length(bins)
    bin_lower = bins(i);
    bin_upper = bin_lower + bin_width;
    
    % Count pairs within the current lag
    pairs_within_lag = distances >= bin_lower & distances < bin_upper;
    
    if any(pairs_within_lag)
        gamma(i) = 0.5 * mean((T(pairs_within_lag) - T(pairs_within_lag)').^2);
        counts(i) = sum(pairs_within_lag);
    end
end

% Plot the omni-directional variogram
figure(12);
plot(bins, gamma, 'o-', 'LineWidth', 2);
xlabel('Distance (h) in meters');
ylabel('Semi-Variance (gamma)');
title('Omni-Directional Variogram for Temperature');
grid on;

% Optionally, you can plot the counts against distance to see the number of pairs in each bin
% figure;
% plot(bins, counts, 'o-', 'LineWidth', 2);
% xlabel('Distance (h) in meters');
% ylabel('Number of Pairs');
% title('Number of Pairs vs. Distance');
% grid on;
