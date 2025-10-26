%% problem 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a) moving windows for matrix T 90x110
windowsize=[9,11]; % a rectangular window with height of 9 rows and width of 10 colmuns 

[mean_T, std_T]= MvngWindOpert(T, windowsize);

figure(1);
subplot(2,1,1);
imshow(mean_T, []);
title('Moving window means for T', 'fontsize', 10);
ylabel('y(m)');
hcb=colorbar;
ylabel(hcb,'T moving window means (m)')

subplot(2,1,2);
imshow(std_T, []);
grid on;
title('Moving window stds for T ', 'FontSize', 10);
xlabel('x(m)');
ylabel('y(m)');
hcb=colorbar;
ylabel(hcb,'T moving window stds (m)')
colormap('jet');

% a) moving windows for matrix S 90x110
[mean_S, std_S]= MvngWindOpert(S, windowsize);

figure(2);
subplot(2,1,1);
imshow(mean_S, []);
title('Moving window means for S', 'fontsize', 10);
ylabel('y(m)');
hcb=colorbar;
ylabel(hcb,'S moving window means (ppm)')


subplot(2,1,2);
imshow(std_S, []);
grid on;
title('Moving window stds for S ', 'FontSize', 10);
xlabel('x(m)');
ylabel('y(m)');
hcb=colorbar;
ylabel(hcb,'S moving window stds (ppm)')

colormap('jet');

% b) proportionality effect 
%for T
figure(3)
scatter(mean_T, std_T);
title('Moving windows means vs stds for T')
xlabel('Mean (m)')
ylabel('Std (m)')
%corelation coefficient 
corrcoef_T = corrcoef(mean_T, std_T);
fprintf('corrcoef_T: %.4f\n', corrcoef_T(1,2))
 
%for S
figure(4)
scatter(mean_S, std_S);
title('Moving windows means vs stds for S')
xlabel('Mean (ppm)')
ylabel('Std (ppm)')
%corelation coefficient 
corrcoef_S = corrcoef(mean_S, std_S);
fprintf('corrcoef_S: %.4f\n', corrcoef_S(1,2))
%corrcoef_T: 0.6550
%corrcoef_S: 0.1324
%% problem 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a) h-scatterplots(lagged scatterplot) for variable S
% h=(1 east-west,1 nourth-south)
lag_rows =1;   
lag_cols = 1;
[rows, cols] = size(S);

S_original = [];   %empty arrays to store the values 
S_lagged = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original(end+1) = S(i,j);
        S_lagged(end+1) = S(i-lag_rows, j-lag_cols);
    end
end

figure(5)
scatter(S_original, S_lagged, 'marker', '.'); hold on;
xlabel('S(t) ppm');
ylabel('S(t+h) ppm');
title ('h-scatterplot of S for h=(1,1)');
plot(xlim,ylim,'--black');
legend('data pairs', 'x=y reference line', 'Location','northwest'); hold off;

% h=(2,2)
lag_rows =2;   
lag_cols = 2;
[rows, cols] = size(S);

S_original_2 = [];   %empty arrays to store the values 
S_lagged_2 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_2(end+1) = S(i,j);
        S_lagged_2(end+1) = S(i-lag_rows, j-lag_cols);
    end
end

figure(6)
scatter(S_original_2, S_lagged_2, 'marker', '.'); hold on;
xlabel('S(t) ppm');
ylabel('S(t+h) ppm');
title ('h-scatterplot of S for h=(2,2)');
plot(xlim,ylim,'--black');
legend('data pairs', 'x=y reference line', 'Location','northwest'); hold off;

% h=(3,3)
lag_rows =3;   
lag_cols = 3;
[rows, cols] = size(S);

S_original_3 = [];   %empty arrays to store the values 
S_lagged_3 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_3(end+1) = S(i,j);
        S_lagged_3(end+1) = S(i-lag_rows, j-lag_cols);
    end
end


figure(7)
scatter(S_original_3, S_lagged_3, 'marker', '.'); hold on;
xlabel('S(t) ppm');
ylabel('S(t+h) ppm');
title ('h-scatterplot of S for h=(3,3)');
plot(xlim,ylim,'--black');
legend('data pairs', 'x=y reference line', 'Location','northwest'); hold off;

%h=(4,4)
lag_rows =4;   
lag_cols = 4;
[rows, cols] = size(S);

S_original_4 = [];   %empty arrays to store the values 
S_lagged_4 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_4(end+1) = S(i,j);
        S_lagged_4(end+1) = S(i-lag_rows, j-lag_cols);
    end
end


figure(8)
scatter(S_original_4, S_lagged_4, 'marker', '.'); hold on;
xlabel('S(t) ppm');
ylabel('S(t+h) ppm');
title ('h-scatterplot of S for h=(4,4)');
plot(xlim,ylim,'--black');
legend('data pairs', 'x=y reference line', 'Location','northwest'); hold off;

%h=(5,5)
lag_rows =5;   
lag_cols = 5;
[rows, cols] = size(S);

S_original_5 = [];   %empty arrays to store the values 
S_lagged_5 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_5(end+1) = S(i,j);
        S_lagged_5(end+1) = S(i-lag_rows, j-lag_cols);
    end
end


figure(9)
scatter(S_original_5, S_lagged_5, 'marker', '.'); hold on;
xlabel('S(t) ppm');
ylabel('S(t+h) ppm');
title ('h-scatterplot of S for h=(5,5)');
plot(xlim,ylim,'--black');
legend('data pairs', 'x=y reference line', 'Location','northwest'); hold off;

%h=(6,6)
lag_rows =6;   
lag_cols = 6;
[rows, cols] = size(S);

S_original_6 = [];    
S_lagged_6 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_6(end+1) = S(i,j);
        S_lagged_6(end+1) = S(i-lag_rows, j-lag_cols);
    end
end


figure(10)
scatter(S_original_6, S_lagged_6, 'marker', '.'); hold on;
xlabel('S(t) ppm');
ylabel('S(t+h) ppm');
title ('h-scatterplot of S for h=(6,6)');
plot(xlim,ylim,'--black');
legend('data pairs', 'x=y reference line', 'Location','northwest'); hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% more h %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% h=(7,7)
lag_rows =7;   
lag_cols = 7;
[rows, cols] = size(S);
S_original_7 = [];    
S_lagged_7 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_7(end+1) = S(i,j);
        S_lagged_7(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(8,8)
lag_rows =8;   
lag_cols = 8;
[rows, cols] = size(S);
S_original_8 = [];    
S_lagged_8 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_8(end+1) = S(i,j);
        S_lagged_8(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(9,9)
lag_rows =9;   
lag_cols = 9;
[rows, cols] = size(S);
S_original_9 = [];    
S_lagged_9 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_9(end+1) = S(i,j);
        S_lagged_9(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(10,10)
lag_rows =10;   
lag_cols = 10;
[rows, cols] = size(S);
S_original_10 = [];    
S_lagged_10 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_10(end+1) = S(i,j);
        S_lagged_10(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(11,11)
lag_rows =11;   
lag_cols = 11;
[rows, cols] = size(S);
S_original_11 = [];    
S_lagged_11 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_11(end+1) = S(i,j);
        S_lagged_11(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(12,12)
lag_rows =12;   
lag_cols = 12;
[rows, cols] = size(S);
S_original_12 = [];    
S_lagged_12 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_12(end+1) = S(i,j);
        S_lagged_12(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(13,13)
lag_rows =13;   
lag_cols = 13;
[rows, cols] = size(S);
S_original_13 = [];    
S_lagged_13 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_13(end+1) = S(i,j);
        S_lagged_13(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(14,14)
lag_rows =14;   
lag_cols = 14;
[rows, cols] = size(S);
S_original_14 = [];    
S_lagged_14 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_14(end+1) = S(i,j);
        S_lagged_14(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(15,15)
lag_rows =15;   
lag_cols = 15;
[rows, cols] = size(S);
S_original_15 = [];    
S_lagged_15 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_15(end+1) = S(i,j);
        S_lagged_15(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(16,16)
lag_rows =16;   
lag_cols = 16;
[rows, cols] = size(S);
S_original_16 = [];    
S_lagged_16 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_16(end+1) = S(i,j);
        S_lagged_16(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(17,17)
lag_rows =17;   
lag_cols = 17;
[rows, cols] = size(S);
S_original_17 = [];    
S_lagged_17 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_17(end+1) = S(i,j);
        S_lagged_17(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(18,18)
lag_rows =18;   
lag_cols = 18;
[rows, cols] = size(S);
S_original_18 = [];    
S_lagged_18 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_18(end+1) = S(i,j);
        S_lagged_18(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(19,19)
lag_rows =19;   
lag_cols = 19;
[rows, cols] = size(S);
S_original_19 = [];    
S_lagged_19 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_19(end+1) = S(i,j);
        S_lagged_19(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%h=(20,20)
lag_rows =20;   
lag_cols = 20;
[rows, cols] = size(S);
S_original_20 = [];    
S_lagged_20 = [];

for i = 1+lag_rows: rows
    for j = 1+lag_cols: cols
        S_original_20(end+1) = S(i,j);
        S_lagged_20(end+1) = S(i-lag_rows, j-lag_cols);
    end
end
%% The grams 
%calculate the hypotenuse for h 
h=[1 1; 2 2; 3 3; 4 4; 5 5; 6 6; 7 7; 8 8; 9 9; 10 10; 11 11; 12 12; 13 13; 14 14; 15 15; 16 16; 17 17; 18 18; 19 19; 20 20];
num_points = size(h, 1);
hyp_h = [];
for i= 1:num_points
    x = h(i,1);
    y = h(i,2);
    hyp_h(end+1) = hypot(x,y);
end 
%calculate the correlation coefficient 
A={S_original, S_original_2, S_original_3,S_original_4, S_original_5,S_original_6, S_original_7,S_original_8,S_original_9,S_original_10,S_original_11,S_original_12,S_original_13,S_original_14,S_original_15,S_original_16,S_original_17,S_original_18, S_original_19,S_original_20};
B={S_lagged, S_lagged_2, S_lagged_3, S_lagged_4, S_lagged_5, S_lagged_6,S_lagged_7,S_lagged_8,S_lagged_9,S_lagged_10,S_lagged_11,S_lagged_12,S_lagged_13,S_lagged_14,S_lagged_15,S_lagged_16,S_lagged_17,S_lagged_18,S_lagged_19,S_lagged_20};

co_cofs= zeros(1, numel(A));
for i = 1:numel(A)
    calacu_co=corrcoef(A{i},B{i});
    co_cofs(i)=calacu_co(1,2);
end 
figure(17)
scatter(hyp_h , co_cofs,'filled', 'marker', 'o', 'MarkerEdgeColor', 'b'); hold on;
plot(hyp_h, co_cofs, '-', 'Color', 'black');
xlabel('|h|');
ylabel('\rho (h)');
title ('correlogram for h=(1-20,1-20)'); hold off;

%calculate the covariance 
covar= zeros(1, numel(A));
for i = 1:numel(A)
    calacu_covar= cov(A{i},B{i});
    covar(i)=calacu_covar(1,2);
end
figure(18)
scatter(hyp_h , covar,'filled', 'marker', 'o', 'MarkerEdgeColor', 'b'); hold on;
plot(hyp_h, covar, '-', 'Color', 'black');
xlabel('|h|');
ylabel('C(h)');
title ('covariogram for h=(1-20,1-20)'); hold off;

%variogram
var =zeros(1, numel(A));
for i = 1:numel(A)
    A_data = A{i};
    B_data =B{i};
    sqr_diff=(A_data-B_data).^2;
    variog = 0.5*mean(sqr_diff(:));
    var(i)=variog;
end

figure(19)
scatter(hyp_h , var,'filled', 'marker', 'o', 'MarkerEdgeColor', 'b'); hold on;
plot(hyp_h, var, '-', 'Color', 'black');
plot(Y, m,'--r');
xlabel('|h|');
ylabel('\gamma (h)');
legend('Location','best');
title ('variogram for h=(1-20,1-20)'); hold off;

%nugget, sill, range
initial_sill = max(var);
initial_nugget = min(var);
initial_range = 0.6; %from the graph, when does the plot starts to platue
fprintf('initial_sill: %f\n', initial_sill )
fprintf('initial_nugget: %f\n', initial_nugget )
fprintf('initial_range: %f\n', initial_range )
spherical_model=@(params, h) params(1)+params(2)*(3/2)*(h/params(3)-1/2*(h/params(3)).^3);
initial_params = [initial_sill,initial_range,initial_nugget];
fitted_params = lsqcurvefit(spherical_model,initial_params, hyp_h, var);
sill = fitted_params(1);
range = fitted_params(2);
nugget = fitted_params(3);
fprintf('estimated sill: %f\n', sill )
fprintf('estimated range: %f\n', range )
fprintf('estimated nugget: %f\n', nugget )
%% initial_sill: 0.542411
%initial_nugget: 0.053005
%initial_range: 0.600000
%% estimated sill: 0.046115
%estimated range: 0.585593
%estimated nugget: 34.781538


