clear all

figure(1);
data = csvread('Basic_Wein_Bridge_FFT.csv', 1, 0);
freq = data(:, 1);
db = data(:, 2);
plot(freq, db);
hold on;
SpiceFile = fopen('Wein_Bridge_Basic_SIM_FFT.txt');
data = cell2mat(textscan(SpiceFile, '%f(%fdB,%f°)', 'CollectOutput',1));
freq = data(:, 1);
db = data(:, 2);
plot(freq, db);
hold on;
data = csvread('Basic_Wein_Bridge_FFT_Potentiometer.csv', 1, 0);
freq = data(:, 1);
db = data(:, 2);
plot(freq, db);
hold on;
data = csvread('Diode_Wein_Bridge_FFT.csv', 1, 0);
freq = data(:, 1);
db = data(:, 2);
plot(freq, db);
hold on;
SpiceFile = fopen('Wein_Bridge_Diodes_SIM_FFT.txt');
data = cell2mat(textscan(SpiceFile, '%f(%fdB,%f°)', 'CollectOutput',1));
freq = data(:, 1);
db = data(:, 2);
plot(freq, db);
hold off;
legend('Basic Measuered','Basic Simulated','R_{f} Potentiometer Optimised','AGC with Diodes Measured','AGC with Diodes Simulated');
xlabel('Frequency [Hz]');
ylabel('Signal Amplitude [dB]');
title("Wein Bridge Oscillator Frequency Response")
xlim([0,3e4])
ylim([-80,20])
grid
saveas(figure(1), "weinerbridge.svg");


figure(2);
data = csvread('Basic_Phase_Shift_FFT.csv', 1, 0);
freq = data(:, 1);
db = data(:, 2);
plot(freq, db);
hold on;
SpiceFile = fopen('Phase_Shift_Basic_SIM_FFT.txt');
data = cell2mat(textscan(SpiceFile, '%f(%fdB,%f°)', 'CollectOutput',1));
freq = data(:, 1);
db = data(:, 2);
plot(freq, db);
hold on;
data = csvread('Basic_Phase_Shift_FFT_Potentiometer.csv', 1, 0);
freq = data(:, 1);
db = data(:, 2);
plot(freq, db);
hold on;
data = csvread('Diode_Phase-Shift_FFT.csv', 1, 0);
freq = data(:, 1);
db = data(:, 2);
plot(freq, db);
hold on;
SpiceFile = fopen('Phase_Shift_Diodes_SIM_FFT.txt');
data = cell2mat(textscan(SpiceFile, '%f(%fdB,%f°)', 'CollectOutput',1));
freq = data(:, 1);
db = data(:, 2);
plot(freq, db);
hold off;
legend('Basic Measuered','Basic Simulated','R_{f} Potentiometer Optimised','AGC with Diodes Measured','AGC with Diodes Simulated');
xlabel('Frequency [Hz]');
ylabel('Signal Amplitude [dB]');
title("Phase-Shift Oscillator Frequency Response")
xlim([0,1.5e4])
xticks(0:.25e4:1.5e4)
ylim([-80,20])
grid
saveas(figure(2), "shiftyphases.svg");

%% Root Locus Solver for the Phase-Shift Oscillator
s=tf('s');
R = 3300;
C = .01e-6;
RF = 100000;
RG = 15000;
A = 1+(RF/RG);
B = (1/((R*C*s)+1))^3;
H = A/(1+(A*B));
tiledlayout(1,3)
nexttile;
rlocus(H)

%% Root Locus Solver for the Wein-Bridge Oscillator
s=tf('s');
R = 3183.1;
C = .01e-6;
RF = 220240;
RG = 11000;
A = 1+(RF/RG);
B = 1/(3+(R*C*s)+(1/(R*C*s)));
H = A/(1+(A*B));
rlocus(H)
title('Root Locus of the Wein-Bridge Oscillator R_{f} = 220.24k, R_{g} = 11kΩ')

%%
s=tf('s');
R = 3183.1;
C = .01e-6;
RF = 220240;
RG = 11000;
A = 1+(RF/RG);
B = 1/(3+(R*C*s)+(1/(R*C*s)));
H = 50/(s+50);
rlocus(H)
