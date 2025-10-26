X_meters = X*1000; 
Y_meters = Y*1000;
% distance between data points
n = length(X_meters);
h = zeros(n,n);
for i = 1:n
    for j = 1:n
        h(i,j) = sqrt((X_meters(i) - X_meters(j) )^2 + (Y_meters(i) - Y_meters(j) )^2 );
    end 
end 

% binning h and calculating 
max_distance = max(h(:));
num_bins = 22; 
bin_edges = linspace(0, max_distance, num_bins);
variogram = zeros(1, num_bins - 1);

for i = 1:(num_bins - 1)
    distances_in_bin = h >= bin_edges(i) & h < bin_edges(i + 1);
    if any(distances_in_bin)
        pairwise_differences = [];
        for j = 1:n
            for k = j+1:n
                if distances_in_bin(j) && distances_in_bin(k)
                    pairwise_differences(end + 1) = (T(j) - T(k))^2;
                end
            end
        end
        variogram(i) = 0.5 * mean(pairwise_differences);
    else
        variogram(i) = NaN; % No data points in the bin
    end
end

figure(20);
plot(bin_edges(1:end-1), variogram, '-o'); hold on;
plot(bin_edges(1:end-1), variogram, '-', 'Color', 'black');
title('Omnidirectional Variogram');
xlabel('h (m)');
ylabel('\gamma (h)'); hold off;
%% sill, range and nugget with spherical model fitting
% reference values
sill = max(variogram);
nugget = min(variogram);
range_estimate = bin_edges(find(variogram == sill, 1));

% Plot the fitted model
fitted_variogram = nugget + (sill - nugget) * (1.5 * (bin_edges(1:end-1) / range_estimate) - 0.5 * (bin_edges(1:end-1) / range_estimate).^3);

figure(21); 
plot(bin_edges(1:end-1), variogram, '-o', 'DisplayName', 'Experimental Variogram'); hold on;
plot(bin_edges(1:end-1), fitted_variogram, 'r-','DisplayName', 'Fitted Spherical Model');
%legend('Experimental Variogram', 'Fitted Spherical variogram Model');
title('Experimental vs Fitted variogram model');
xlabel('h (m)');
ylabel('\gamma (h)');
legend('show');
grid on; hold off;
figure(22);hold on;
plot(bin_edges(1:end-1), fitted_variogram, 'r-','DisplayName', 'Fitted Spherical Model');hold off;

disp(['Sill: ', num2str(sill)]);
disp(['Range: ', num2str(range_estimate)]);
disp(['Nugget: ', num2str(nugget)]);



