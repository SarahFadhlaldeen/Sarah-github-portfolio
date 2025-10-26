%% estimate E and T at locations (4,16), (12,9) using polygons
%%%% I will use the same code and just will change the locations %%%%%%

% target location, will use the same code, for (4,16) then (12,9)
target_x = 4; 
target_y = 16; 

% creating a mesh grid to define the polygons
cell_size = 2; % 2 km
x_min = min(X);
x_max = max(X);
y_min = min(Y);
y_max = max(Y);
[x_grid, y_grid] = meshgrid(x_min:cell_size:x_max, y_min:cell_size:y_max);

polygon_indices = zeros(size(x_grid));
% Loop through the data points and assign them to polygon indices
for i = 1:length(X)
    x_index = find(X(i) >= x_grid(1, :), 1, 'last');
    y_index = find(Y(i) >= y_grid(:, 1), 1, 'last');
    x_index = max(1, min(x_index, size(x_grid, 2)));
    y_index = max(1, min(y_index, size(x_grid, 1)));
    polygon_indices(y_index, x_index) = i; % Store data point index in the corresponding polygon
end

% polygon index for the target location
x_target_index = find(target_x >= x_grid(1, :), 1, 'last');
y_target_index = find(target_y >= y_grid(:, 1), 1, 'last');
x_target_index = max(1, min(x_target_index, size(x_grid, 2)));
y_target_index = max(1, min(y_target_index, size(x_grid, 1)));
target_polygon_index = polygon_indices(y_target_index, x_target_index);

% finding data points within the same polygon as the target point
points_in_polygon = find(polygon_indices == target_polygon_index);

% calculating the weighted average for E and T within the target polygon
weighted_average_E = sum(E(points_in_polygon)) / length(points_in_polygon);
weighted_average_T = sum(T(points_in_polygon)) / length(points_in_polygon);

fprintf('Estimated Elevation at X=%.2fkm,Y=%.2fkm:%.2f MASL\n', target_x, target_y, weighted_average_E);
fprintf('Estimated Temperature at X=%.2fkm,Y=%.2f km:%.2fCelsius\n', target_x, target_y, weighted_average_T);

figure(3);
estimated_E = weighted_average_E;hold on;
scatter(target_x, target_y, 100, estimated_E, 'filled', 'MarkerEdgeColor','r','DisplayName','Estimated point =16.15 MASL');
scatter(X, Y, 50, E, 'filled');
colormap(parula); 
hcb = colorbar;
ylabel(hcb,'Elevation (MASL)') 
xlabel('East Location (km)');
ylabel('North Location (km)');
title('E with estimated data value using polygons');
legend('Estimated point =16.15 MASL');
grid();hold off;

figure(4);
estimated_T = weighted_average_T;hold on;
scatter(target_x, target_y, 100, estimated_T, 'filled', 'MarkerEdgeColor','r', 'DisplayName','Estimated point =33.52\circC');
scatter(X, Y, 50, T, 'filled');
colormap(parula); 
hcb = colorbar;
ylabel(hcb,'Temperature (\circC)') 
xlabel('East Location (km)');
ylabel('North Location (km)');
title('T with estimated data value using polygons');
legend('Estimated point =33.52\circC'); 
grid(); hold off;

%Estimated Elevation at X=4.00km,Y=16.00km:16.15 MASL
%Estimated Temperature at X=4.00km,Y=16.00 km:33.52Celsius
%%Estimated Elevation at X=12.00km,Y=9.00km:83.62 MASL
%Estimated Temperature at X=12.00km,Y=9.00 km:33.72Celsius

%% estimate E and T at locations (4,16), (12,9) using triangulation
%%%% I will use the same code and just will change the locations %%%%%%

%Creating a Delaunay triangulation of (X, Y) to form a triangular mesh
DT = delaunayTriangulation(X, Y);
target_point = [4, 16];

% finding the triangle that contains target point
triangle_index = pointLocation(DT, target_point);

if ~isnan(triangle_index)
    % defining barycentric coordinates of the target point within the triangle
    barycentricCoords = cartesianToBarycentric(DT, triangle_index, target_point);
    
    % Getting the indices of the vertices of the triangle that contains the point
    vertexIndices = DT.ConnectivityList(triangle_index, :);
    
    % interpolating elevation and temperature using the barycentric coordinates
    % and calculate a weighted mean of the values using the barycentric coordinates
    Estimated_E = dot(barycentricCoords, E(vertexIndices));
    Estimated_T = dot(barycentricCoords, T(vertexIndices));
   
    fprintf('Estimated Elevation at X=%.2fkm,Y=%.2fkm:%.2f MASL\n',target_point(1), target_point(2), Estimated_E);
    fprintf('Estimated Temperature at X=%.2fkm,Y=%.2f km:%.2fCelsius\n',target_point(1), target_point(2), Estimated_T);
else
    % if target point is outside the convex hull
    fprintf('target point is outside the convex hull, interpolation is not possible.\n');
    Estimated_E = NaN;
    Estimated_T = NaN;
end

figure(5);
triplot(DT);hold on;
scatter(target_point(1), target_point(2), 100,  Estimated_E, 'filled', 'MarkerEdgeColor','r','DisplayName','Estimated point=156.75 MASL');
scatter(X, Y, 50, E, 'filled');
colormap(parula); 
hcb = colorbar;
ylabel(hcb,'Elevation (MASL)') 
xlabel('East Location (km)');
ylabel('North Location (km)');
title('E with estimated data value using Delaunay triangulation','FontSize', 12);
legend('Triangulation','Estimated point=156.75 MASL', 'Location','northeast');hold off;

figure(6);
triplot(DT);hold on;
scatter(target_point(1), target_point(2), 100,  Estimated_T, 'filled', 'MarkerEdgeColor','r','DisplayName','Estimated point=33.32\circC');
scatter(X, Y, 50, T, 'filled');
colormap(parula); 
hcb = colorbar;
ylabel(hcb,'Temperature (\circC)') 
xlabel('East Location (km)');
ylabel('North Location (km)');
title('T with estimated data value using Delaunay triangulation','FontSize', 12);
legend('Triangulation','Estimated point=33.32\circC', 'Location','northeast'); hold off;

%Estimated Elevation at X=4.00km,Y=16.00km:29.98 MASL
%Estimated Temperature at X=4.00km,Y=16.00 km:33.69Celsius
%Estimated Elevation at X=12.00km,Y=9.00km:156.75 MASL
%Estimated Temperature at X=12.00km,Y=9.00 km:33.32Celsius

%% estimate E and T at locations (4,16), (12,9) using inverse-distance
%%%% I will use the same code and just will change the locations %%%%%%

target_Point = [12, 9];

% euclidean distance function
distanceFunction = @(x, y) sqrt((x - target_Point(1)).^2 + (y - target_Point(2)).^2);

% distances between target and all data points
distances = distanceFunction(X, Y);
distexpo_p = 5;% distance exponent p 
weights = 1 ./ (distances.^distexpo_p);% inverse of the distance 
weights = weights / sum(weights); % weights should add up to 1

Estimated_Elevation = sum(weights .* E);
Estimated_Temperature = sum(weights .* T);

fprintf('Estimated Elevation at X=4km, Y=16km, p=5: %.2f MASL\n', Estimated_Elevation);
fprintf('Estimated Temperature at X=4km, Y=16km, p=5: %.2f Celsius\n', Estimated_Temperature);


figure(7);
scatter(target_Point(1), target_Point(2), 100,  Estimated_Elevation, 'filled', 'MarkerEdgeColor','r','DisplayName','Estimated point=156.48 MASL');hold on;
for i = 1:length(X)
    line([X(i), target_Point(1)], [Y(i), target_Point(2)], 'Color', 'k', 'LineStyle', ':');
end
scatter(X, Y, 50, E, 'filled');
colormap(parula); 
hcb = colorbar;
ylabel(hcb,'Elevation (MASL)') 
xlabel('East Location (km)');
ylabel('North Location (km)');
title('E with estimated data value using inverse distance, p=5','FontSize', 12);
legend('Estimated point=156.48 MASL','distances', 'Location','northeast');
grid();hold off;

figure(8);
scatter(target_Point(1), target_Point(2), 100,  Estimated_Temperature, 'filled', 'MarkerEdgeColor','r','DisplayName','Estimated point=33.35 Celsius');hold on;
for i = 1:length(X)
    line([X(i), target_Point(1)], [Y(i), target_Point(2)], 'Color', 'k', 'LineStyle', ':');
end
scatter(X, Y, 50, T, 'filled');
colormap(parula); 
hcb = colorbar;
ylabel(hcb,'Temperature (\circC)') 
xlabel('East Location (km)');
ylabel('North Location (km)');
title('T with estimated data value using inverse distance, p=5','FontSize', 12);
legend('Estimated point=33.35 Celsius','distances', 'Location','northeast');
grid();hold off;

%Estimated Elevation at X=4km, Y=16km, p=5: 32.04 MASL
%Estimated Temperature at X=4km, Y=16km, p=5: 33.69 Celsius
%Estimated Elevation at X=4km, Y=16km, p=5: 156.48 MASL
%Estimated Temperature at X=4km, Y=16km, p=5: 33.35 Celsius

%% estimate E on a rigular grid of size 0.2x0.2 km

%%%% using triangulation %%%%
gridSpacing = 0.1; 

% Create a regular grid for interpolation
[xGrid, yGrid] = meshgrid(min(X):gridSpacing:max(X), min(Y):gridSpacing:max(Y));
F = TriScatteredInterp(X, Y, E);%triangulation-based interpolation

% evaluate the interpolation on the grid
E_grid = F(xGrid, yGrid);

figure;
scatter(xGrid(:), yGrid(:), 10, E_grid(:), 'filled');  
xlabel('East Location (km)');
ylabel('North Location (km)');
title('Estimated Elevation on a reigular grid using triangulation');
colorbar;
hcb = colorbar;
ylabel(hcb,'E values on a rigular grid'); hold off;
hold on;
triangulation = delaunay(X, Y);hold on; 
triplot(triangulation, X, Y, 'k'); 
hold off;

%% estimate E on a rigular grid of size 0.2x0.2 km

%%%% using inv distance %%%%
gridSpacing = 0.1; 

% Create a regular grid for estimation
[xGrid, yGrid] = meshgrid(min(X):gridSpacing:max(X), min(Y):gridSpacing:max(Y));
[numRows, numCols] = size(xGrid);
E_grid = zeros(numRows, numCols);

p= 2;
searchRadius = 2 * gridSpacing; 
% Iterate over each grid point and estimate elevation 
for i = 1:numRows
    for j = 1:numCols
        x = xGrid(i, j);
        y = yGrid(i, j);
        
        % Calculate the distances between the grid point and observed locations
        distances = sqrt((X - x).^2 + (Y - y).^2);
        weights = 1 ./ (distances.^p);
        
        % Normalize the weights
        weights = weights / sum(weights);
        
        % Estimate the elevation using IDW
        E_grid(i, j) = sum(weights .* E);
    end
end

figure;
scatter(xGrid(:), yGrid(:), 10, E_grid(:), 'filled');hold on;
plot(E_grid(:))
colorbar;
hcb = colorbar;
ylabel(hcb,'E values on a rigular grid');
xlabel('East Location (km)');
ylabel('North Location (km)');
title('Estimated Elevation on a reigular grid using inverse distance');hold off;




