% For S
% to generate a normal histogram 
histogram(S(:), 'Normalization', 'probability', 'BinMethod', 'auto');
title('S Normal Histogram');
xlabel('Silver Quantity S (ppm)');
ylabel('Probability');