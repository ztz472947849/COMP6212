clear;
load('data.mat');

T = size(c3025, 1);
quarter = round(T/4);

implied_volatilities = zeros(T, 1);
calculated_volatilities = zeros(T, 1);

for t = (quarter + 1):T
    implied_volatilities(t) = blsimpv(c3025(t, 3), 3025, 0.06, (T + 1 - t) / 252, c3025(t, 2));
    window = c3025((t-quarter):t, 3);
    u = tick2ret(window, [], 'Continuous');
    s = std(u);
    N = size(window, 1);
    calculated_volatilities(t) = s / sqrt(N / 252);
end

figure;
scatter(implied_volatilities((quarter + 1):T), calculated_volatilities((quarter + 1):T));
hold on;
plot(0:0.05:0.05, 0:0.05:0.05);
title('Implied volatility vs estimated volatility');
xlabel('Implied volatility');
ylabel('Estmated volatility');

strike_prices = (2925:100:3325)';
implied_volatilities = zeros(size(strike_prices, 1), 1);

t = 208;
for n = 1:size(strike_prices, 1)
    strike_price = strike_prices(n);
    data = dlmread(sprintf('Data/c%d.prn', strike_price));
    T = size(data, 1);
    implied_volatilities(n) = blsimpv(data(t, 3), strike_price, 0.06, (T + 1 - t) / 252, data(t, 2));
end

figure;
scatter(strike_prices, implied_volatilities);
title(sprintf('Strike price vs implied volatility for day %d', t));
xlabel('Strike price');
ylabel('Implied volatility');
