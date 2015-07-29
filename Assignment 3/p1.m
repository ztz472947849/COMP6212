clear;
load('data.mat');

strike_prices = [ones(222, 1) * 2925; ones(222, 1) * 3025; ones(222, 1) * 3125; ones(222, 1) * 3225; ones(222, 1) * 3325];

% Actual prices normalised by strike price (S/X)
actual_prices = [c2925(:, 3) / 2925; c3025(:, 3) / 3025; c3125(:, 3) / 3125; c3225(:, 3) / 3225; c3325(:, 3) / 3325];

% Times (T - t)
t = linspace(222 / 252, 0, 222)';
times = [t; t; t; t; t];

prices2925 = c2925(:, 3);
N = size(prices2925, 1);
volatility = std(tick2ret(prices2925, [], 'Continuous')) / sqrt(N / 252);
[call, put] = blsprice(prices2925, 2925, 0.06, t, volatility);
delta2925 = blsdelta(call + 1, 2925, 0.06, t + 1, volatility);
call2925 = call / 2925;

prices3025 = c3025(:, 3);
N = size(prices3025, 1);
volatility = std(tick2ret(prices3025, [], 'Continuous')) / sqrt(N / 252);
[call, put] = blsprice(prices3025, 3025, 0.06, t, volatility);
delta3025 = blsdelta(call + 1, 3025, 0.06, t + 1, volatility);
call3025 = call / 3025;

prices3125 = c3125(:, 3);
N = size(prices3125, 1);
volatility = std(tick2ret(prices3125, [], 'Continuous')) / sqrt(N / 252);
[call, put] = blsprice(prices3125, 3125, 0.06, t, volatility);
delta3125 = blsdelta(call + 1, 3125, 0.06, t + 1, volatility);
call3125 = call / 3125;

prices3225 = c3225(:, 3);
N = size(prices3225, 1);
volatility = std(tick2ret(prices3225, [], 'Continuous')) / sqrt(N / 252);
[call, put] = blsprice(prices3225, 3225, 0.06, t, volatility);
delta3225 = blsdelta(call + 1, 3225, 0.06, t + 1, volatility);
call3225 = call / 3225;

prices3325 = c3325(:, 3);
N = size(prices3325, 1);
volatility = std(tick2ret(prices3325, [], 'Continuous')) / sqrt(N / 252);
[call, put] = blsprice(prices3325, 3325, 0.06, t, volatility);
delta3325 = blsdelta(call + 1, 3325, 0.06, t + 1, volatility);
call3325 = call / 3325;

% Black-Scholes predicted call option prices normalised by strike price
% (C/X)
bls_prices = [call2925; call3025; call3125; call3225; call3325];

bls_deltas = [delta2925; delta3025; delta3125; delta3225; delta3325];

plot_mesh(actual_prices, times, bls_prices);
xlabel('S/X');
ylabel('T - t');
zlabel('C/X');
