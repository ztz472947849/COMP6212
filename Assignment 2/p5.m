clear;
load('data.mat');
T = size(c3125, 1);
quarter = round(T / 4);
t = 75;

window = c3125((t-quarter):t, 3);
u = tick2ret(window, [], 'Continuous');
s = std(u);
N = size(window, 1);
volatility = s / sqrt(N / 252);

diffs = zeros(100, 1);
deltaTs = linspace(0.01, 0.2, 100);
for n = 1:100
    [call, put] = blsprice(c3125(t, 3), 3125, 0.06, (T + 1 - t) / 252, volatility);
    [AssetPrice, OptionValue] = binprice(c3125(t, 3), 3125, 0.06, (T + 1 - t) / 252, deltaTs(n), volatility, 1);
    diffs(n) = abs(call - OptionValue(1, 1));
end
scatter(deltaTs, diffs);
xlabel('Delta T');
ylabel('Black-Scholes estimate - Binomial Lattice estimate');