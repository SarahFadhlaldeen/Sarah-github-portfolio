% craeting scatter plot for 30th line of btoht T and S 
hold on;
scatter(T(30,:), S(30,:), 'filled');
title(['line',' ', num2str(30),' ', 'of T and S' ]);
xlabel('T (m)');
ylabel('S (ppm)');
%%%% best fit line 
coefficients = polyfit(T(30,:), S(30,:), 1);
slope = coefficients(1);
intercept = coefficients(2);
best_line = (slope * T(30,:)) + intercept;
plot(T(30,:), best_line, '-r', 'LineWidth', 1.5);
legend('Data points', 'Best fit')
hold off;
%calculting the correlation coefficient 
corrcoef_TS = corrcoef(T(30,:), S(30,:));
%corrcoef_ST = corrcoef(S(30,:), T(30,:));
fprintf('corrcoef_TS: %.4f\n', corrcoef_TS(1,2));
fprintf('corrcoef_ST: %.4f\n', corrcoef_ST(1,2));

% The correlation coefficient is as calculated by the algorithm 'corrcoef_TS: 0.6790'. 
% In both cases when x is T and y is S and the opposite, they are positivly 
% correlated since the correlation coefficient is positive
