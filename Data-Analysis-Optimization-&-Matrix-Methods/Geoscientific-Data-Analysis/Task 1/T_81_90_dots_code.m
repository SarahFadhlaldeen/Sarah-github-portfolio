%plotting lines 81-90 of T as dots 
plot_lines = 81:90;
figure;
for lines_number = plot_lines % to loop through 81-90 lines of T and plot them separatily on the same graph 
    scatter(1:size(T,2), T(lines_number,:), 'filled');
    hold on;
end
title(' T 81-90 lines as dots');
xlabel('Data points index');
ylabel('Elevation T (m)');
hold off;