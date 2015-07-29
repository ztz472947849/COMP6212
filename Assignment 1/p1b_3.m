m = [ 0.10, 0.20 ]';
C = [
      [  0.005, -0.010 ]
      [ -0.010,  0.040 ]
    ];

E = zeros(100, 1);
V = zeros(100, 1);

for n = 1:100
    y = rand(2, 1);
    y = y / norm(y, 1);
    E(n) = m' * y;
    for i = 1:2
        for j = 1:2
            V(n) = V(n) + C(i, j) * y(i) * y(j);
        end
    end
end

for n = 1:100
    V(n) = sqrt(V(n));
end

frontcon(m, C);
title('E-V plot and efficient frontier of two-asset model 3');
hold on;
scatter(V, E);