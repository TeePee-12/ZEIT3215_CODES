%%RC Passive Low Pass
filename = 'RC_LOW_PASS_MEASURED_DATA.csv';
data = csvread(filename, 1, 0);
rcfreq = data(:, 1);
rcmag = data(:, 2);
rcang = data(:, 3);
%%1st Order Active Low Pass
filename = 'ACTIVE_1ST_ORDER_LOW_PASS_MEASURED_DATA.csv';
data = csvread(filename, 1, 0);
actfreq = data(:, 1);
actmag = data(:, 2);
actang = data(:, 3);
%%2nd Order Active Low Pass
filename = 'ACTIVE_2ND_ORDER_LOW_PASS_MEASURED_DATA.csv';
data = csvread(filename, 1, 0);
skfreq = data(:, 1);
skmag = data(:, 2);
skang = data(:, 3);

figure(1);
tiledlayout(2,1);
sgtitle("Bode Plots of Different Low Pass Filtering Topologies")
nexttile;
semilogx(rcfreq, rcmag);
hold on;
semilogx(actfreq, actmag);
hold on;
semilogx(skfreq, skmag);
hold off;
legend('Passive RC Filter','1st Order Active Filter','2nd Order Active Sallen-Key Filter','location','southwest');
xlabel('Frequency [Hz]');
ylabel('Amplitude [dB]');
grid on;
nexttile;
semilogx(rcfreq, rcang);
hold on;
semilogx(actfreq, actang);
hold on;
semilogx(skfreq, skang);
hold off;
legend('Passive RC Filter','1st Order Active Filter','2nd Order Active Sallen-Key Filter','location','northwest');
xlabel('Frequency [Hz]');
ylabel('Signal Phase Ange [Deg]');
grid on;
saveas(figure(1), "Low-Pass Filter Bode Plots.svg");

%%RC Passive High Pass
filename = 'RC_HIGH_PASS_MEASURED_DATA.csv';
data = csvread(filename, 1, 0);
rcfreq = data(:, 1);
rcmag = data(:, 2);
rcang = data(:, 3);
%%1st Order Active High Pass
filename = 'ACTIVE_1ST_ORDER_HIGH_PASS_MEASURED_DATA.csv';
data = csvread(filename, 1, 0);
actfreq = data(:, 1);
actmag = data(:, 2);
actang = data(:, 3);
%%2nd Order Active high Pass
filename = 'ACTIVE_2ND_ORDER_HIGH_PASS_MEASURED_DATA.csv';
data = csvread(filename, 1, 0);
skfreq = data(:, 1);
skmag = data(:, 2);
skang = data(:, 3);

figure(2);
tiledlayout(2,1);
sgtitle("Bode Plots of Different High Pass Filtering Topologies")
nexttile;
semilogx(rcfreq, rcmag);
hold on;
semilogx(actfreq, actmag);
hold on;
semilogx(skfreq, skmag);
hold off;
legend('Passive RC Filter','1st Order Active Filter','2nd Order Active Sallen-Key Filter','location','southeast');
xlabel('Frequency [Hz]');
ylabel('Amplitude [dB]');
grid on;
nexttile;
semilogx(rcfreq, rcang);
hold on;
semilogx(actfreq, actang);
hold on;
semilogx(skfreq, skang);
hold off;
legend('Passive RC Filter','1st Order Active Filter','2nd Order Active Sallen-Key Filter','location','southwest');
xlabel('Frequency [Hz]');
ylabel('Signal Phase Ange [Deg]');
grid on;
saveas(figure(2), "High-Pass Filter Bode Plots.svg");

