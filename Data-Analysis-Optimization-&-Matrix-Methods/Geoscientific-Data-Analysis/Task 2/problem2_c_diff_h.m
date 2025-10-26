% c) repeate b for different h's
% h=(1,-1)
lag_row = -1; % north, south
lag_col = 1;  
[rows, cols] = size(S);

S_orig_1 = [];   %empty arrays to store the values 
S_laged_1 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_1(end+1) = S(i,j);
        S_laged_1(end+1) = S(i-lag_row, j+lag_col);
    end
end

figure(11)
scatter(S_orig_1, S_laged_1, 'marker', '.'); hold on;
xlabel('S(t) ppm');
ylabel('S(t+h) ppm');
title ('h-scatterplot of S for h=(1,-1)');
plot(xlim,ylim,'--black');
legend('data pairs', 'x=y reference line', 'Location','northwest'); hold off;

% h=(2,-2)
lag_row = -2; 
lag_col = 2;  
[rows, cols] = size(S);

S_orig_2 = [];   
S_laged_2 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_2(end+1) = S(i,j);
        S_laged_2(end+1) = S(i-lag_row, j+lag_col);
    end
end

figure(12)
scatter(S_orig_2, S_laged_2, 'marker', '.'); hold on;
xlabel('S(t) ppm');
ylabel('S(t+h) ppm');
title ('h-scatterplot of S for h=(2,-2)');
plot(xlim,ylim,'--black');
legend('data pairs', 'x=y reference line', 'Location','northwest'); hold off;

% h=(3,-3)
lag_row = -3; 
lag_col = 3;  
[rows, cols] = size(S);

S_orig_3 = [];   
S_laged_3 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_3(end+1) = S(i,j);
        S_laged_3(end+1) = S(i-lag_row, j+lag_col);
    end
end

figure(13)
scatter(S_orig_3, S_laged_3, 'marker', '.'); hold on;
xlabel('S(t) ppm');
ylabel('S(t+h) ppm');
title ('h-scatterplot of S for h=(3,-3)');
plot(xlim,ylim,'--black');
legend('data pairs', 'x=y reference line', 'Location','northwest'); hold off;

% h=(4,-4)
lag_row = -4; 
lag_col = 4;  
[rows, cols] = size(S);

S_orig_4 = [];   
S_laged_4 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_4(end+1) = S(i,j);
        S_laged_4(end+1) = S(i-lag_row, j+lag_col);
    end
end

figure(14)
scatter(S_orig_4, S_laged_4, 'marker', '.'); hold on;
xlabel('S(t) ppm');
ylabel('S(t+h) ppm');
title ('h-scatterplot of S for h=(4,-4)');
plot(xlim,ylim,'--black');
legend('data pairs', 'x=y reference line', 'Location','northwest'); hold off;

% h=(5,-5)
lag_row = -5; 
lag_col = 5;  
[rows, cols] = size(S);

S_orig_5 = [];   
S_laged_5 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_5(end+1) = S(i,j);
        S_laged_5(end+1) = S(i-lag_row, j+lag_col);
    end
end

figure(15)
scatter(S_orig_5, S_laged_5, 'marker', '.'); hold on;
xlabel('S(t) ppm');
ylabel('S(t+h) ppm');
title ('h-scatterplot of S for h=(5,-5)');
plot(xlim,ylim,'--black');
legend('data pairs', 'x=y reference line', 'Location','northwest'); hold off;

% h=(6,-6)
lag_row = -6; 
lag_col = 6;  
[rows, cols] = size(S);

S_orig_6 = [];   
S_laged_6 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_6(end+1) = S(i,j);
        S_laged_6(end+1) = S(i-lag_row, j+lag_col);
    end
end

figure(16)
scatter(S_orig_6, S_laged_6, 'marker', '.'); hold on;
xlabel('S(t) ppm');
ylabel('S(t+h) ppm');
title ('h-scatterplot of S for h=(6,-6)');
plot(xlim,ylim,'--black');
legend('data pairs', 'x=y reference line', 'Location','northwest'); hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% more h%%%%%%%%%%%%%
% h=(7,-7)
lag_row = -7; 
lag_col = 7;  
[rows, cols] = size(S);

S_orig_7 = [];   
S_laged_7 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_7(end+1) = S(i,j);
        S_laged_7(end+1) = S(i-lag_row, j+lag_col);
    end
end

%h=(8,-8)
lag_row = -8; 
lag_col = 8;  
[rows, cols] = size(S);

S_orig_8 = [];   
S_laged_8 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_8(end+1) = S(i,j);
        S_laged_8(end+1) = S(i-lag_row, j+lag_col);
    end
end

% h=(9,-9)
lag_row = -9; 
lag_col = 9;  
[rows, cols] = size(S);

S_orig_9 = [];   
S_laged_9 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_9(end+1) = S(i,j);
        S_laged_9(end+1) = S(i-lag_row, j+lag_col);
    end
end

% h=(10,-10)
lag_row = -10; 
lag_col = 10;  
[rows, cols] = size(S);

S_orig_10 = [];   
S_laged_10 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_10(end+1) = S(i,j);
        S_laged_10(end+1) = S(i-lag_row, j+lag_col);
    end
end

% h=(11,-11)
lag_row = -11; 
lag_col = 11;  
[rows, cols] = size(S);

S_orig_11 = [];   
S_laged_11 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_11(end+1) = S(i,j);
        S_laged_11(end+1) = S(i-lag_row, j+lag_col);
    end
end

% h=(12,-12)
lag_row = -12; 
lag_col = 12;  
[rows, cols] = size(S);

S_orig_12 = [];   
S_laged_12 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_12(end+1) = S(i,j);
        S_laged_12(end+1) = S(i-lag_row, j+lag_col);
    end
end

%h=(13,-13)
lag_row = -13; 
lag_col = 13;  
[rows, cols] = size(S);

S_orig_13 = [];   
S_laged_13 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_13(end+1) = S(i,j);
        S_laged_13(end+1) = S(i-lag_row, j+lag_col);
    end
end

%h=(14,-14)
lag_row = -14; 
lag_col = 14;  
[rows, cols] = size(S);

S_orig_14 = [];   
S_laged_14 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_14(end+1) = S(i,j);
        S_laged_14(end+1) = S(i-lag_row, j+lag_col);
    end
end

%h(15,-15)
lag_row = -15; 
lag_col = 15;  
[rows, cols] = size(S);

S_orig_15 = [];   
S_laged_15 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_15(end+1) = S(i,j);
        S_laged_15(end+1) = S(i-lag_row, j+lag_col);
    end
end

%h=(16,-16)
lag_row = -16; 
lag_col = 16;  
[rows, cols] = size(S);

S_orig_16 = [];   
S_laged_16 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_16(end+1) = S(i,j);
        S_laged_16(end+1) = S(i-lag_row, j+lag_col);
    end
end

%h=(17,-17)
lag_row = -17; 
lag_col = 17;  
[rows, cols] = size(S);

S_orig_17 = [];   
S_laged_17 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_17(end+1) = S(i,j);
        S_laged_17(end+1) = S(i-lag_row, j+lag_col);
    end
end

%h=(18,-18)
lag_row = -18; 
lag_col = 18;  
[rows, cols] = size(S);

S_orig_18 = [];   
S_laged_18 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_18(end+1) = S(i,j);
        S_laged_18(end+1) = S(i-lag_row, j+lag_col);
    end
end

%h=(19,-19)
lag_row = -19; 
lag_col = 19;  
[rows, cols] = size(S);

S_orig_19 = [];   
S_laged_19 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_19(end+1) = S(i,j);
        S_laged_19(end+1) = S(i-lag_row, j+lag_col);
    end
end

%h=(20,-20)
lag_row = -20; 
lag_col = 20;  
[rows, cols] = size(S);

S_orig_20 = [];   
S_laged_20 = [];

for i = 1: rows+lag_row
    for j = 1: cols-lag_col
        S_orig_20(end+1) = S(i,j);
        S_laged_20(end+1) = S(i-lag_row, j+lag_col);
    end
end
%% The grams 
%calculate the hypotenuse for h % we will get the same since the numbers are squared, so ill use the same h calculated before 
C={S_orig_1,S_orig_2,S_orig_3, S_orig_4,S_orig_5, S_orig_6, S_orig_7,S_orig_8, S_orig_9, S_orig_10, S_orig_11,S_orig_12, S_orig_13,S_orig_14,S_orig_15,S_orig_16,S_orig_17,S_orig_18,S_orig_19, S_orig_20};
D={S_laged_1, S_laged_2, S_laged_3, S_laged_4, S_laged_5, S_laged_6, S_laged_7, S_laged_8, S_laged_9, S_laged_10, S_laged_11,S_laged_12, S_laged_13,S_laged_14,S_laged_15,S_laged_16,S_laged_17,S_laged_18,S_laged_19,S_laged_20};

%calculate the correlation coefficient
c_cofs= zeros(1, numel(C));
for i = 1:numel(C)
    cal_co=corrcoef(C{i},D{i});
    c_cofs(i)=cal_co(1,2);
end 
figure(20)
scatter(hyp_h , c_cofs,'filled', 'marker', 'o', 'MarkerEdgeColor', 'b'); hold on;
plot(hyp_h, co_cofs, '-', 'Color', 'black');
xlabel('|h|');
ylabel('\rho (h)');
title ('correlogram for h=(1-20, -ve 1-20)'); hold off;

%calculate the covariance 
covar_2= zeros(1, numel(C));
for i = 1:numel(C)
    calacu_covar_2= cov(C{i},D{i});
    covar_2(i)=calacu_covar_2(1,2);
end
figure(21)
scatter(hyp_h , covar_2,'filled', 'marker', 'o', 'MarkerEdgeColor', 'b'); hold on;
plot(hyp_h, covar_2, '-', 'Color', 'black');
xlabel('|h|');
ylabel('C(h) ppm^2');
title ('covariogram for h=(1-20,-ve 1-20)'); hold off;

%variogram
var_2 =zeros(1, numel(C));
for i = 1:numel(C)
    C_data = C{i};
    D_data =D{i};
    sqr_diff_2=(C_data-D_data).^2;
    variog_2 = 0.5*mean(sqr_diff_2(:));
    var_2(i)=variog_2;
end

figure(22)
scatter(hyp_h , var_2,'filled', 'marker', 'o', 'MarkerEdgeColor', 'b'); hold on;
plot(hyp_h, var_2, '-', 'Color', 'black');
xlabel('|h|');
ylabel('\gamma (h) ppm^2');
title ('variogram for h=(1-20,-ve 1-20)'); hold off;