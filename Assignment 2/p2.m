clear;
load('data.mat');

for strike_price = 2925:100:3325
    data1 = dlmread(sprintf('Data/c%d.prn', strike_price));
    data2 = dlmread(sprintf('Data/p%d.prn', strike_price));
    stock_prices = data1(:, 3);
    call_prices = data1(:, 2);
    put_prices = data2(:, 2);
    T = size(stock_prices, 1);
    quarter = floor(T / 4);
    
    bls_call_prices = zeros(T, 1);
    bls_put_prices = zeros(T, 1);
    for t = (quarter + 1):T
        window = stock_prices((t-quarter):t);
        u = tick2ret(window, [], 'Continuous');
        s = std(u);
        N = size(window, 1);
        volatility = s / sqrt(N / 252);
        [call, put] = blsprice(stock_prices(t), strike_price, 0.06, (T + 1 - t) / 252, volatility);
        bls_call_prices(t) = call;
        bls_put_prices(t) = put;
    end
    figure;
    plot(bls_call_prices(1:T));
    hold on;
    plot(call_prices(1:T));
    title(sprintf('c%d', strike_price));
    legend('Estimated price', 'Actual price');
    xlabel('Time');
    ylabel('Price');
    figure;
    plot(bls_put_prices(1:T));
    hold on;
    plot(put_prices(1:T));
    title(sprintf('p%d', strike_price));
    legend('Estimated price', 'Actual price');
    xlabel('Time');
    ylabel('Price');
end

% T = size(p2925, 1);
% start_time = round(T / 4 + 1);
% 
% prices = zeros(T, 1);
% 
% for t = start_time:T
%     window = p2925(round(t - T/4):t, :);
%     u = tick2ret(window(:,3), [], 'Continuous');
%     s = std(u);
%     N = size(window, 1);
%     volatility = s / sqrt(N / 252);
%     [call, put] = blsprice(p2925(t, 3), 2925, 0.06, (T + 1 - t) / 252, volatility);
%     prices(t) = put;
% end
% 
% plot(p2925(start_time:T, 2));
% hold on;
% plot(prices(start_time:T));
% legend('True price', 'Estimated price');