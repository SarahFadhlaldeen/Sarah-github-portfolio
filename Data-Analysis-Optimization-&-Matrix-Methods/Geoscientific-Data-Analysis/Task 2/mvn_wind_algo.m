
mean_T = zeros(size(T) - windowsize_T +1); %storing mean results of T
std_T = zeros(size(T) - windowsize_T +1);  %storing std results of T

for j = 1:size(mean_T, 2)
    for i = 1:size(mean_T,1)
        windowT = T(i:i+windowsize_T(1)-1, j:j+windowsize_T(2)-1);
        mean_T(i,j) = mean(windowT(:));
        std_T(i,j) = std(windowT(:));
    end
end

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
windowsize_S =[9,11]; % a rectangular window with height of 9 rows and width of 10 colmuns 

mean_S = zeros(size(S) - windowsize_S +1); %storing mean results of S
std_S = zeros(size(S) - windowsize_S +1);  %storing std results of S

for j = 1:size(mean_S, 2)
    for i = 1:size(mean_S,1)
        windowS = S(i:i+windowsize_S(1)-1, j:j+windowsize_S(2)-1);
        mean_S(i,j) = mean(windowS(:));
        std_S(i,j) = std(windowS(:));
    end
end

figure(2);
subplot(2,1,1);
imshow(mean_S, []);
title('Moving window means for S', 'fontsize', 10);
ylabel('y(m)');
hcb=colorbar;
ylabel(hcb,'S moving window means (m)')


subplot(2,1,2);
imshow(std_S, []);
grid on;
title('Moving window stds for S ', 'FontSize', 10);
xlabel('x(m)');
ylabel('y(m)');
hcb=colorbar;
ylabel(hcb,'S moving window stds (m)')

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
xlabel('Mean (m)')
ylabel('Std (m)')
%corelation coefficient 
corrcoef_S = corrcoef(mean_S, std_S);
fprintf('corrcoef_S: %.4f\n', corrcoef_S(1,2))