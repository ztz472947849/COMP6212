p1;

data = [actual_prices times];
N = size(data, 1);

result = fitgmdist(data, 4, 'Options', statset('MaxIter', 1000));

design_matrix = zeros(N, 7);
design_matrix(:, 7) = ones(N, 1);

design_matrix(:, 5:6) = data;

for j = 1:4
    mean = result.mu(j, :)';
    cov = result.Sigma(:, :, j);
    for n = 1:N
        x = data(n, :)';
        design_matrix(n, j) = sqrt((x - mean)' * cov * (x - mean));
    end
end

w = inv(design_matrix' * design_matrix) * design_matrix' * bls_prices;

rbf_prices = design_matrix * w;

plot_mesh(actual_prices, times, rbf_prices);
xlabel('S/X');
ylabel('T - t');
zlabel('C/X');

plot_mesh(actual_prices, times, rbf_prices - bls_prices(:, 1));
xlabel('S/X');
ylabel('T - t');
zlabel('C/X error');

figure;
plot(bls_prices);
hold on;
plot(rbf_prices);
legend('Black-Scholes', 'RBF');

mean_bls=[];
mean_rbf=[];
figure;
for t= [1,1+222,1+444,1+666,1+888]
    mean_bls=[mean_bls ;std(bls_prices(t:t+221))];
    mean_rbf=[mean_rbf ;std(rbf_prices(t:t+221))];
end
plot(mean_bls);
hold on
plot(mean_rbf);
legend('Black-Scholes','RBF');
title('data fitness');
xlabel('trading years');
ylabel('annual shifting ratio');
