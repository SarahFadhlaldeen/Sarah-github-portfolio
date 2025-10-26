%For T
% to generate a cumulative histogram
[counts, edges] = histcounts(T(:), 'BinMethod', 'auto');  %creating the histogram 
cumulative_counts = cumsum(counts);   %calculating the cumulative counts 
bar(edges(1:end-1), cumulative_counts, 'hist' ); %creating the cumultaive histo 
title('T Cumulative Histogram');
xlabel('Elevation T (m)');
ylabel('Cumulatve frquency');