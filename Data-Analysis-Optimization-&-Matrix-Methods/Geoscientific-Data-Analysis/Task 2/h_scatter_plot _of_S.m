cor_cof_1 =corrcoef(S_original, S_lagged);
cor_cof_2 =corrcoef(S_original_2, S_lagged_2);
cor_cof_3 =corrcoef(S_original_3, S_lagged_3);
cor_cof_4 =corrcoef(S_original_4, S_lagged_4);
cor_cof_5 =corrcoef(S_original_5, S_lagged_5);
cor_cof_6 =corrcoef(S_original_6, S_lagged_6);
cor_cof_7 =corrcoef(S_original_7, S_lagged_7);
result= [cor_cof_1(1,2), cor_cof_2(1,2), cor_cof_3(1,2), cor_cof_4(1,2),cor_cof_5(1,2),cor_cof_6(1,2),cor_cof_7(1,2)];

A={S_original, S_original_2, S_original_3,S_original_4, S_original_5,S_original_6};
B={S_lagged, S_lagged_2, S_lagged_3, S_lagged_4, S_lagged_5, S_lagged_6};

co_cofs= zeros(1, numel(A));

for i = 1:numel(A)
    calacu_co=corrcoef(A{i},B{i});
    co_cofs(i)=calacu_co(1,2);
end 

for i = 1:numel(A)
    fprintf('correlation cofficient between A_%d and B_%d: %f\n', i, i, co_cofs(i) )
end

figure(44)
scatter(hyp_h , co_cofs,'filled', 'marker', 'o');
xlabel('|h|');
ylabel('\rho (h)');
title ('h-scatterplot of S for h=(6,6)');