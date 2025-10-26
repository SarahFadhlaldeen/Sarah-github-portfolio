%For S
% to generate a cumulative histogram
[counts, edges] = histcounts(S(:), 'BinMethod', 'auto');  %creating the histogram 
cumulative_counts = cumsum(counts);   %calculating the cumulative counts 
bar(edges(1:end-1), cumulative_counts, 'hist' ); %creating the cumultaive histo 
title('S Cumulative Histogram');
xlabel('Silver quantity S (ppm)');
ylabel('Cumulatve frquency');