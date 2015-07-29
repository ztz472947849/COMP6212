clear;

x = linspace(30, 55)';
N = size(x, 1);
y = zeros(N, 1);

for n = 1:N
    if x(n) > 45
        y(n) = x(n) - 45;
    elseif x(n) < 40
        y(n) = 40 - x(n);
    end
end

plot(x, y);
title('Trader profit as a function of asset price at maturity');
xlabel('S(T)');
ylabel('Profit');