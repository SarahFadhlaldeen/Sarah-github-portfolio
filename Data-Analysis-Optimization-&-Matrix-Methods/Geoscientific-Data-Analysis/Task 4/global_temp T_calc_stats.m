% Define the cell sizes
cell_sizes = 1:10; % Cell sizes in kilometers

% Initialize arrays to store the global means
glbl_mean_E = zeros(length(cell_sizes), 1);
global_mean_temperature = zeros(length(cell_sizes), 1);

for i = 1:length(cell_sizes)
    cell_size = cell_sizes(i);

    % Calculate the number of cells in both X and Y directions
    num_cel_x = ceil(max(X) / cell_size);
    num_cel_y = ceil(max(Y) / cell_size);

    % Initialize arrays to store the cell means
    cell_means_elevation = zeros(num_cel_x, num_cel_y);
    cell_means_temperature = zeros(num_cel_x, num_cel_y);

    % Loop through the data points and assign them to cells
    for j = 1:length(E)
        cell_x = ceil(X(j) / cell_size);
        cell_y = ceil(Y(j) / cell_size);
        
        cell_means_elevation(cell_x, cell_y) = cell_means_elevation(cell_x, cell_y) + E(j);
        cell_means_temperature(cell_x, cell_y) = cell_means_temperature(cell_x, cell_y) + T(j);
    end

    % Calculate the global mean for elevation and temperature
    non_empty_cells = (cell_means_elevation + cell_means_temperature) > 0;
    cell_means_elevation(non_empty_cells) = cell_means_elevation(non_empty_cells) ./ non_empty_cells(non_empty_cells);
    cell_means_temperature(non_empty_cells) = cell_means_temperature(non_empty_cells) ./ non_empty_cells(non_empty_cells);

    glbl_mean_E(i) = mean(cell_means_elevation(:));
    global_mean_temperature(i) = mean(cell_means_temperature(:));
end

% Display the global means for different cell sizes

fprintf('Global Mean E for cell size 2km: %.2f MASL\n', glbl_mean_E(cell_sizes == 2));
fprintf('Global Mean T for cell size 2km: %.2f celsius\n ', global_mean_temperature(cell_sizes == 2));
%% trial 2 more details %%%%%%%%
% Define cell sizes
cell_sizes = 1:10; % Sizes from 1x1 to 10x10

% Initialize arrays to store global means for elevation and temperature
glbl_mean_E = zeros(1, numel(cell_sizes));
global_mean_temperature = zeros(1, numel(cell_sizes));

for i = 1:numel(cell_sizes)
    cell_size = cell_sizes(i);
    
    % Calculate the number of cells in x and y direction
    num_cel_x = ceil(max(X) / cell_size);
    num_cel_y = ceil(max(Y) / cell_size);
    
    % Initialize arrays to store cell weights and sums for elevation and temperature
    cell_weights_elevation = zeros(num_cel_y, num_cel_x);
    cell_sums_elevation = zeros(num_cel_y, num_cel_x);
    
    cell_weights_temperature = zeros(num_cel_y, num_cel_x);
    cell_sums_temperature = zeros(num_cel_y, num_cel_x);
    
    for j = 1:numel(X)
        % Calculate the cell index for each data point
        cell_x = ceil(X(j) / cell_size);
        cell_y = ceil(Y(j) / cell_size);
        
        % Update the cell weights and sums for elevation and temperature
        cell_weights_elevation(cell_y, cell_x) = cell_weights_elevation(cell_y, cell_x) + 1;
        cell_sums_elevation(cell_y, cell_x) = cell_sums_elevation(cell_y, cell_x) + E(j);
        
        cell_weights_temperature(cell_y, cell_x) = cell_weights_temperature(cell_y, cell_x) + 1;
        cell_sums_temperature(cell_y, cell_x) = cell_sums_temperature(cell_y, cell_x) + T(j);
    end
    
    % Calculate the weighted global mean for elevation and temperature
    glbl_mean_E(i) = sum(cell_sums_elevation(:) ./ cell_weights_elevation(:)) / numel(E);
    global_mean_temperature(i) = sum(cell_sums_temperature(:) ./ cell_weights_temperature(:)) / numel(T);
end

% Display the global means for different cell sizes
disp('Cell Size | Global Mean Elevation | Global Mean Temperature');
for i = 1:numel(cell_sizes)
    fprintf('%5dx%5d | %20.4f | %23.4f\n', cell_sizes(i), cell_sizes(i), glbl_mean_E(i), global_mean_temperature(i));
end

figure;
subplot(2, 1, 1);
plot(cell_sizes, glbl_mean_E, '-o', 'LineWidth', 2);
title('Global Mean Elevation vs. Cell Size');
xlabel('Cell Size (km)');
ylabel('Global Mean Elevation');

subplot(2, 1, 2);
plot(cell_sizes, global_mean_temperature, '-o', 'LineWidth', 2);
title('Global Mean Temperature vs. Cell Size');
xlabel('Cell Size (km)');
ylabel('Global Mean Temperature');

%% cell declustring (a+b)
cell_sizes = 1:10; % Cell sizes in km

%arrays to store global means for elevation and temperature
glbl_mean_E = zeros(size(cell_sizes));
glbl_mean_T = zeros(size(cell_sizes));

for i = 1:length(cell_sizes)
    cell_size = cell_sizes(i);
    
    % Calculate the number of cells in the (area X by Y)
    num_cel_x = ceil(max(X) / cell_size);
    num_cel_y = ceil(max(Y) / cell_size);
    
    %arrays to store the means for each cell
    cell_mean_E = zeros(num_cel_x, num_cel_y);
    cell_mean_T = zeros(num_cel_x, num_cel_y);
    
    for cell_x = 1:num_cel_x
        for cell_y = 1:num_cel_y
            % bounds of the current cell
            cell_x_min = (cell_x - 1) * cell_size;
            cell_x_max = cell_x * cell_size;
            cell_y_min = (cell_y - 1) * cell_size;
            cell_y_max = cell_y * cell_size;
            
            % finding data points within the current cell
            in_cell = X >= cell_x_min & X < cell_x_max & Y >= cell_y_min & Y < cell_y_max;
            
            % calculating weights for the cell based on the number of data points within
            weight = 1 / sum(in_cell);
            
            % calculating weighted mean for E and T within the cell
            cell_mean_E(cell_x, cell_y) = weight * sum(E(in_cell));
            cell_mean_T(cell_x, cell_y) = weight * sum(T(in_cell));
        end
    end
    
    % calculating the global mean for E and Te using the calculated cell means
    glbl_mean_E(i) = mean(cell_mean_E(:));
    glbl_mean_T(i) = mean(cell_mean_T(:));
end

figure(1);
plot(cell_sizes(cell_sizes == 2), glbl_mean_E(cell_sizes == 2), 'o', 'MarkerFaceColor','r'); hold on;
plot(cell_sizes, glbl_mean_E, 'Marker','o','Color', 'b');
title('Global Mean of E as function of Cell Size');
xlabel('Cell Size (km)');
ylabel('Global Mean Elevation (MASL)');hold off;
legend('cell size 2km')

figure(2);
plot(cell_sizes(cell_sizes == 2), glbl_mean_T(cell_sizes == 2), 'o', 'MarkerFaceColor','r'); hold on;
plot(cell_sizes, glbl_mean_T, 'Marker','o','Color', 'b');
title('Global Mean of T as function of Cell Size');
xlabel('Cell Size (km)');
ylabel('Global Mean Temperature (\circC)');hold off;
legend('cell size 2km')

fprintf('Global Mean E for cell size 2km: %.2f MASL\n', glbl_mean_E(cell_sizes == 2));
fprintf('Global Mean T for cell size 2km: %.2f celsius\n ', glbl_mean_T(cell_sizes == 2));
%Global Mean E for cell size 2km: 86.11 MASL
%Global Mean T for cell size 2km: 33.51 celsius











