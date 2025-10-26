%computing moving window statistics to determin proportionality effect 
plot_lines = 81:90;
% we have the elevation data length (110 columns x 80(the grid size) = 8800 m), and the width is the lines 81-90
% form the book, the window size depends on the spacing between data locations and the overall dimension of the area being studied 
% so to have a rectangular window, 10 lines(81-90) and maybe 80-100 meter for length (pure guess since we have 8800m for length if i was correct in the first place!), 
%in my humble intuition it is a good window size for plotting (avoiding clustering) the mean and standard deviation to determin proportionality effect 
window_size = 80;
window_means = [];  %to store the values in 
window_stds = [];

%we need to loop through the lines to calculate the number of windows and to calculate the means and stds
for lines = plot_lines
    lines_number = T(lines, :);
    windows_number = length(lines_number) - window_size + 1;
    lines_window_means = zeros(1, windows_number);
    lines_window_stds = zeros(1, windows_number);
    %nested loop to calculate means and stds of the windows 
    for i = 1 : windows_number
        lines_window_means(i) = mean(lines_number(i : i + window_size - 1));
        lines_window_stds(i) = std(lines_number(i : i + window_size - 1));
    end
    %use the previously generated arrays to store the results 
    window_means = [lines_window_means];
    window_stds = [lines_window_stds];
end

%plot the mean and standard deviation in a scatter plot 
scatter(window_means, window_stds, 'filled' );
title('Moving windows means vs stds for lines 81-90 of T')
xlabel('Mean')
ylabel('Std')
%corelation coefficient 
corrcoef_pe = corrcoef(window_means, window_stds);
fprintf('corrcoef_pe: %.4f\n', corrcoef_pe(1,2))

% the corelation coefficient is 'corrcoef_pe: -0.9938' which is very close
% to 1, means a strong relationship between the mean and std, hence there
% is a proportionality effect in T data for lines 81-90.



