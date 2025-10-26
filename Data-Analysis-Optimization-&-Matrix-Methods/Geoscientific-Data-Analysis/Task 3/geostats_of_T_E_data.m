%% summary stats for E
min_E = min(E);
max_E = max(E);
mean_E = mean(E);
std_E = std(E);
iqr_E = iqr(E);
num_loc_E = length(X);%since just the number of location you use either X or Y because they have the same dimensions 
fprintf('min_E: %.4f\n', min_E);
fprintf('max_E: %.4f\n', max_E);
fprintf('mean_E: %.4f\n', mean_E);
fprintf('std_E: %.4f\n', std_E);
fprintf('iqr_E: %.4f\n', iqr_E);
fprintf('num_loc_E: %.4f\n', num_loc_E);
%min_E: 14.5613
%max_E: 286.6499
%mean_E: 111.5490
%std_E: 52.3449
%iqr_E: 68.9353
%num_loc_E: 445.0000
figure(1); hold on;
hist_E = histogram(E);
title('Elevation(E) histogram');
xlabel('E (MASL)');
ylabel('frequency'); hold off;
%% summary stats for T
min_T = min(T);
max_T = max(T);
mean_T = mean(T);
std_T = std(T);
iqr_T = iqr(T);
num_loc_T = length(X);
fprintf('min_T: %.4f\n', min_T);
fprintf('max_T: %.4f\n', max_T);
fprintf('mean_T: %.4f\n', mean_T);
fprintf('std_T: %.4f\n', std_T);
fprintf('iqr_T: %.4f\n', iqr_T);
fprintf('num_loc_T: %.4f\n', num_loc_T);
%min_T: 32.9517
%max_T: 34.0404
%mean_T: 33.4554
%std_T: 0.1766
%iqr_T: 0.2424
%num_loc_T: 445.0000
figure(2); hold on;
hist_T = histogram(T);
title('Temperature(T) histogram');
xlabel('T (\circC)');
ylabel('frequency'); hold off;
%% scatter plot E vs T
figure(3); hold on;
scatter(E, T, 'Marker','.');
xlabel('E (MASL)');
ylabel('T (\circC)');
title('E vs T scatter plot'); hold off;
cor_cof = corrcoef(E, T);
fprintf('cor_cof_ET: %.4f\n', cor_cof(1,2));
%cor_cof_ET: -0.6411
%% scatter for C=0
%fillter the data for C=0
E_c0 = E(C == 0);
T_c0 = T(C == 0);

figure(4); hold on;
scatter(E_c0, T_c0, 'Marker','.');
xlabel('E (MASL)');
ylabel('T (\circC)');
title('E vs T scatter plot for C=0'); hold off;
cor_cof_0 = corrcoef(E_c0, T_c0);
fprintf('cor_cof_0: %.4f\n', cor_cof_0(1,2));
%cor_cof_0: -0.5587
%% scatter for C=1
%fillter the data for C=1
E_c1 = E(C == 1);
T_c1 = T(C == 1);

figure(5); hold on;
scatter(E_c1, T_c1, 'Marker','.');
xlabel('E (MASL)');
ylabel('T (\circC)');
title('E vs T scatter plot for C=1'); hold off;
cor_cof_1 = corrcoef(E_c1, T_c1);
fprintf('cor_cof_1: %.4f\n', cor_cof_1(1,2));
%cor_cof_1: -0.5636
%% map 
% for C=1, C=0
figure(6);
scatter(X(C == 0), Y(C == 0),'r',"filled"); hold on;
scatter(X(C == 1), Y(C == 1),'b',"filled"); 
xlabel('East location (km)');
ylabel('North location (km)');
title('Observation locations map');
legend('C=0','C=1','Location','northeast');
grid on; hold off; 
%spatial distribution of E
size_C = 50;
figure(7); 
scatter(X, Y,size_C, E,'filled'); hold on;
colormap('parula');
hcb=colorbar;
ylabel(hcb,'E values over the area (MASL) ');
caxis([min(E), max(E)]);
xlabel('East location (km)');
ylabel('North location (km)');
title('spatial distribution of E')
grid on; hold off;

%spatial distribution of T
figure(8);
scatter(X, Y,size_C, T,'filled'); hold on;
colormap('parula');
hcb=colorbar;
ylabel(hcb,'T values over the area (\circC) ');
caxis([min(T), max(T)]);
xlabel('East location (km)');
ylabel('North location (km)');
title('spatial distribution of T ')
grid on; hold off;

%% cross section 
filltered_Y = (Y >= 4 ) & (Y <= 8);
x_cross = X(filltered_Y);
E_cross = E(filltered_Y);
T_cross = T(filltered_Y);

figure(9);
subplot(2,1,1);
scatter(x_cross, E_cross,'filled', 'b', 'LineWidth',2);
ylabel('E (MASL)');
title('cross-section through E');
grid on;
subplot(2,1,2);
scatter(x_cross, T_cross,'filled', 'r', 'LineWidth',2);
xlabel('east location (km)')
ylabel('T (\circC)');
title('cross-section through T');
grid on;
%% omni-directional variogram 
X_coord = X;
Y_coord = Y;
max_lag = 10;         % maximum distance to calculate the variogram
num_lags_bins = 33;        % number of lag bins
lag_step = max_lag / num_lags_bins;
%vectors to store lag distances and variogram values
lag_distances = zeros(num_lags_bins, 1);
variogram_values = zeros(num_lags_bins, 1);
% calculate the omnidirectional variogram
for i = 1:num_lags_bins
    lag_distance = i * lag_step; % the lag distance for the current bin
    
    % squared differences between temperature values for every pair of points separated by the lag distance 
    differences = [];
    for k = 1:445  % here I accounted for the vector size because I kept getting an error of the exceedance of size
        for j = k+1:445
            dist = sqrt((X_coord(k) - X_coord(j))^2 + (Y_coord(k) - Y_coord(j))^2);  % Euclidean distance
            if dist >= lag_distance && dist < (lag_distance + lag_step)
                differences = [differences; (T(k) - T(j))^2];
            end
        end
    end
    
    
    if ~isempty(differences) % the variogram for the current lag
        variogram_values(i) = 0.5 * mean(differences);
    else
        variogram_values(i) = NaN;  % No pairs within this lag distance
    end

    lag_distances(i) = lag_distance; % store the lag distance
end

figure(10);
scatter(lag_distances , variogram_values,'filled', 'marker', 'o','MarkerFaceColor','k', 'MarkerEdgeColor', 'k'); hold on;
plot(lag_distances, variogram_values, '-', 'Color', 'black');
xlabel(' h(km)');
ylabel('\gamma (h)');
title('T omni-directional Variogram'); hold off;
%% sill, range, and nugget 
%initial parameters values
initial_range = max(lag_distances) / 2;
initial_sill = max(variogram_values);
initial_nugget = min(variogram_values);

% define a spherical variogram model function
spherical_variogram = @(params, h) (params(3) + params(2) * (3 * h / (2 * params(1)) - 1.5 * (h / params(1)).^3));

% using lsqcurvefit function to fit and estimate parameters
params = lsqcurvefit(@(params, h) spherical_variogram(params, h), initial_params, lag_distances, variogram_values);

% extract the estimated parameters
estimated_range = params(1);
estimated_sill = params(2);
estimated_nugget = params(3);

fitted_variogram = spherical_variogram(params, lag_distances);% to plot the fitted model
figure(11);
plot(lag_distances, variogram_values, '-o', 'Color', 'k','MarkerEdgeColor','k','MarkerFaceColor','k');hold on;
plot(lag_distances , fitted_variogram,'r-');
xlabel(' h(km)');
ylabel('\gamma (h)');
title('T omni-directional Variogram vs fitted spherical var. model'); 
legend('experimental omni-var.','fitted spherical var. model', 'Location','best') ; hold off;

% Display initial and estimated parameters
%estimated
fprintf('Estimated Range: %f km\n', estimated_range);
fprintf('Estimated Sill: %f\n', estimated_sill);
fprintf('Estimated Nugget: %f\n', estimated_nugget);
%Estimated Range: 12.665340 km
%Estimated Sill: 0.044641
%Estimated Nugget: 0.009891

%initial
fprintf('Initial Range: %f km\n', initial_range);
fprintf('Initial Sill: %f\n', initial_sill);
fprintf('Initial Nugget: %f\n', initial_nugget);
%Initial Range: 5.000000 km
%Initial Sill: 0.036569
%Initial Nugget: 0.008981
    