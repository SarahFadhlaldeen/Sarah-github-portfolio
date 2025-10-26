%plotting lines 81-90 of T as lines 
plot_lines = 81:90;
figure;
for lines_number = plot_lines % to loop through 81-90 lines of T and plot them separatily on the same graph 
    plot(T(lines_number,:));
    hold on;
end
title(' T 81-90 lines as lines');
xlabel('x (m)');
ylabel('Elevation T (m)');
hold off;
