% displaying line 50 from T and S matrices in the same plot with different y-axes
figure;
% the common x-axis 
title(['line',' ', num2str(50),' ', 'of T and S']);
xlabel('x (m)')
%displying T on the left y-axis
yyaxis left;
plot(T(50,:), '-b', 'LineWidth', 1.5);
ylabel('Elevation T (m)');
%displying S on the right y-axis
yyaxis right;
plot(S(50,:), '-g', 'LineWidth', 1.5);
ylabel('Silver quantity S (ppm)');

legend('T', 'S');
ax = gca;
ax.YAxis(1).Color = 'b';
ax.YAxis(2).Color = 'g';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%the two lines are fluctuaing with multiple maximas, and they seems to have their maximas at similar locations  
