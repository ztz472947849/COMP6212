ftse_data;

T = 500;
N = 3;
R = R(1:T, 1:N);
means = sum(R) / T;

covariance = zeros(N, N);
for t = 1:T
    covariance = covariance + (R(t, :) - means)' * (R(t, :) - means);
end
covariance = covariance / T;

cvx_begin quiet
variable w(3)
    maximize(w' * means')
    subject to
        w' * covariance * w <= 0.0088 ^ 2;
        w' * ones(3, 1) == 1;
        w >= 0;
cvx_end

w2 = [1, 1, 1]';
w2 = w2 / norm(w2, 1);

ftse_data;

N = 3;
T = 500;
R = R(501:1001, 1:N);
means = sum(R) / T;
sharpe_1 = sharpe(R * w);
sharpe_2 = sharpe(R * w2);
total_1 = sum(R * w);
total_2 = sum(R * w2);

plot(cumsum(R * w));
hold on;
plot(cumsum(R * w2));
title('Cumulative return over time for efficient and 1/N portfolios');
ylabel('Return');
xlabel('Time');
legend('Efficient portfolio','1/N portfolio')