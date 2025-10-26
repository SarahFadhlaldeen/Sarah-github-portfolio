h=[1 1; 2 2; 3 3; 4 4; 5 5; 6 6];
num_points = size(h, 1);
hyp_h = [];
for i= 1:num_points
    x = h(i,1);
    y = h(i,2);
    hyp_h(end+1) = hypot(x,y);
end 

var =zeros(1, numel(A));
for i = 1:numel(A)
    A_data = A{i};
    B_data =B{i};
    sqr_diff=(A_data-B_data).^2;
    variog = 0.5*mean(sqr_diff(:));
    var(i)=variog;
end

figure(19)
scatter(hyp_h , var,'filled', 'marker', 'o');
xlabel('|h|');
ylabel('\gamma (h) ppm^2');
title ('variogram for h=(1-20,1-20)');