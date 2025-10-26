%For T
% to generate a normal histogram 
histogram(T(:), 'Normalization', 'probability', 'BinMethod', 'auto');
title('T Normal Histogram');
xlabel('Elevation T (m)');
ylabel('Probability');