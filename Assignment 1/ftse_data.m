ftse = csvread('Historical Data/Updated/^FTSE.csv', 1, 6);

stocks(:, 1) = csvread('Historical Data/Updated/AAL.L.csv', 1, 6);
stocks(:, 2) = csvread('Historical Data/Updated/ABF.L.csv', 1, 6);
stocks(:, 3) = csvread('Historical Data/Updated/ADM.L.csv', 1, 6);
stocks(:, 4) = csvread('Historical Data/Updated/ADN.L.csv', 1, 6);
stocks(:, 5) = csvread('Historical Data/Updated/AGK.L.csv', 1, 6);
stocks(:, 6) = csvread('Historical Data/Updated/AHT.L.csv', 1, 6);
stocks(:, 7) = csvread('Historical Data/Updated/ANTO.L.csv', 1, 6);
stocks(:, 8) = csvread('Historical Data/Updated/ARM.L.csv', 1, 6);
stocks(:, 9) = csvread('Historical Data/Updated/AV.L.csv', 1, 6);
stocks(:,10) = csvread('Historical Data/Updated/AZN.L.csv', 1, 6);
stocks(:,11) = csvread('Historical Data/Updated/BA.L.csv', 1, 6);
stocks(:,12) = csvread('Historical Data/Updated/BAB.L.csv', 1, 6);
stocks(:,13) = csvread('Historical Data/Updated/BARC.L.csv', 1, 6);
stocks(:,14) = csvread('Historical Data/Updated/BATS.L.csv', 1, 6);
stocks(:,15) = csvread('Historical Data/Updated/BDEV.L.csv', 1, 6);
stocks(:,16) = csvread('Historical Data/Updated/BG.L.csv', 1, 6);
stocks(:,17) = csvread('Historical Data/Updated/BLND.L.csv', 1, 6);
stocks(:,18) = csvread('Historical Data/Updated/BLT.L.csv', 1, 6);
stocks(:,19) = csvread('Historical Data/Updated/BNZL.L.csv', 1, 6);
stocks(:,20) = csvread('Historical Data/Updated/BP.L.csv', 1, 6);
stocks(:,21) = csvread('Historical Data/Updated/BRBY.L.csv', 1, 6);
stocks(:,22) = csvread('Historical Data/Updated/BT-A.L.csv', 1, 6);
stocks(:,23) = csvread('Historical Data/Updated/CCL.L.csv', 1, 6);
stocks(:,24) = csvread('Historical Data/Updated/CNA.L.csv', 1, 6);
stocks(:,25) = csvread('Historical Data/Updated/CPG.L.csv', 1, 6);
stocks(:,26) = csvread('Historical Data/Updated/CPI.L.csv', 1, 6);
stocks(:,27) = csvread('Historical Data/Updated/CRH.L.csv', 1, 6);
stocks(:,28) = csvread('Historical Data/Updated/DC.L.csv', 1, 6);
stocks(:,29) = csvread('Historical Data/Updated/DGE.L.csv', 1, 6);
stocks(:,30) = csvread('Historical Data/Updated/EXPN.L.csv', 1, 6);

y = tick2ret(ftse);
R = tick2ret(stocks);

[T, N] = size(R);