clear all

%%2ND ORDER ACTIVE LOW_PASS
% Define file name and read data
filename = 'ACTIVE_2ND_ORDER_LOW_PASS_FILTERING_FFT.csv';
data = csvread(filename, 1, 0);

% Extract time and signal data for each channel
time = data(:, 1);
signal1 = data(:, 2);
signal2 = data(:, 3);
% Perform Fourier Transform on each signal
fs = 1 / (time(2) - time(1)); % Sampling frequency
n = length(signal1);
f = (0:n-1) * fs / n; % Frequency vector
signal1_fft = fft(signal1)/n; % Normalized FFT of channel 1
signal2_fft = fft(signal2)/n; % Normalized FFT of channel 2

figure(1);
tiledlayout(2,1);
sgtitle("2nd Order Active Sallen-Key Low-Pass Filtering.")
nexttile;
plot(time, signal1);
ylim([-1.5,1.5])
xlabel('Time [s]');
ylabel('Signal Amplitude [V]');
title('Measured Signal at Filter Input');
nexttile;
plot(time, signal2);
ylim([-1.5,1.5])
xlabel('Time [s]');
ylabel('Signal Amplitude [V]');
title('Measured Signal at Filter Output');
saveas(figure(1), "2ND_ORDER_ACTIVE_LOW_PASS_TIME_DOMAIN.svg");

% Perform Fourier Transform on each signal
signal1_fft = fft(signal1); % Normalized FFT of channel 1
signal2_fft = fft(signal2); % Normalized FFT of channel 2
L=length(signal1);
fs = 1 / (time(2) - time(1));
% sampling frequency
f = fs*(0:(L/2))/L;

P2 = abs(signal1_fft/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
figure(2)
tiledlayout(2,1)
sgtitle("2nd Order Active Sallen-Key Low-Pass Filtering ")
nexttile
stem(f,mag2db(P1))
xlim([0,70000])
xlabel('Frequency [Hz]');
ylabel('Signal Magnitude [dB]');
title('Measured Frequency Spectrum of Input Signal');

P2 = abs(signal2_fft/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
nexttile
stem(f,mag2db(P1))
xlim([0,70000])
xlabel('Frequency [Hz]');
ylabel('Signal Magnitude [dB]');
title('Measured Frequency Spectrum of Output Signal');
saveas(figure(2), "2ND_ORDER_ACTIVE_LOW_PASS_FFT.svg");



%%2ND ORDER ACTIVE HIGH PASS
% Define file name and read data
filename = 'ACTIVE_2ND_ORDER_HIGH_PASS_FILTERING_FFT.csv';
data = csvread(filename, 1, 0);

% Extract time and signal data for each channel
time = data(:, 1);
signal1 = data(:, 2);
signal2 = data(:, 3);

figure(3);
tiledlayout(2,1);
sgtitle("2nd Order Active Sallen-Key High-Pass Filtering.")
nexttile;
plot(time, signal1);
ylim([-1.2,1.2])
xlabel('Time [s]');
ylabel('Signal Amplitude [V]');
title('Measured Signal at Filter Input');
nexttile;
plot(time, signal2);
ylim([-1.2,1.2])
xlabel('Time [s]');
ylabel('Signal Amplitude [V]');
title('Measured Signal at Filter Output');
saveas(figure(3), "2ND_ORDER_ACTIVE_HIGH_PASS_TIME_DOMAIN.svg");

% Perform Fourier Transform on each signal
signal1_fft = fft(signal1); % Normalized FFT of channel 1
signal2_fft = fft(signal2); % Normalized FFT of channel 2
L=length(time);
fs = 1 / (time(2) - time(1));
% sampling frequency
f = fs*(0:(L/2))/L;

P2 = abs(signal1_fft/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
figure(4)
tiledlayout(2,1)
sgtitle("2nd Order Active Sallen-Key High-Pass Filtering ")
nexttile
stem(f,mag2db(P1))
xlim([0,70000])
xlabel('Frequency [Hz]');
ylabel('Signal Magnitude [dB]');
title('Measured Frequency Spectrum of Input Signal');

P2 = abs(signal2_fft/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
nexttile
stem(f,mag2db(P1))
xlim([0,70000])
xlabel('Frequency [Hz]');
ylabel('Signal Magnitude [dB]');
title('Measured Frequency Spectrum of Output Signal');
saveas(figure(4), "2ND_ORDER_ACTIVE_HIGH_PASS_FFT.svg");



%%1ST ORDER ACTIVE LOW PASS
% Define file name and read data
filename = 'ACTIVE_1ST_ORDER_LOW_PASS_FILTERING_FFT.csv';
data = csvread(filename, 1, 0);

% Extract time and signal data for each channel
time = data(:, 1);
signal1 = data(:, 2);
signal2 = data(:, 3);

figure(5);
tiledlayout(2,1);
sgtitle("1st Order Active Low-Pass Filtering.")
nexttile;
plot(time, signal1);
ylim([-1.5,1.5])
xlabel('Time [s]');
ylabel('Signal Amplitude [V]');
title('Measured Signal at Filter Input');
nexttile;
plot(time, signal2);
ylim([-1.5,1.5])
xlabel('Time [s]');
ylabel('Signal Amplitude [V]');
title('Measured Signal at Filter Output');
saveas(figure(5), "1ST_ORDER_ACTIVE_LOW_PASS_TIME_DOMAIN.svg");

% Perform Fourier Transform on each signal
signal1_fft = fft(signal1); % Normalized FFT of channel 1
signal2_fft = fft(signal2); % Normalized FFT of channel 2
L=length(time);
fs = 1 / (time(2) - time(1));
% sampling frequency
f = fs*(0:(L/2))/L;

P2 = abs(signal1_fft/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
figure(6)
tiledlayout(2,1)
sgtitle("1st Order Active Low-Pass Filtering ")
nexttile
stem(f,mag2db(P1))
xlim([0,70000])
xlabel('Frequency [Hz]');
ylabel('Signal Magnitude [dB]');
title('Measured Frequency Spectrum of Input Signal');

P2 = abs(signal2_fft/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
nexttile
stem(f,mag2db(P1))
xlim([0,70000])
xlabel('Frequency [Hz]');
ylabel('Signal Magnitude [dB]');
title('Measured Frequency Spectrum of Output Signal');
saveas(figure(6), "1ST_ORDER_ACTIVE_LOW_PASS_FFT.svg");



%%1ST ORDER ACTIVE HIGH PASS
% Define file name and read data
filename = 'ACTIVE_1ST_ORDER_HIGH_PASS_FILTERING_FFT.csv';
data = csvread(filename, 1, 0);

% Extract time and signal data for each channel
time = data(:, 1);
signal1 = data(:, 2);
signal2 = data(:, 3);

figure(7);
tiledlayout(2,1);
sgtitle("1st Order Active High-Pass Filtering.")
nexttile;
plot(time, signal1);
ylim([-1.2,1.2])
xlabel('Time [s]');
ylabel('Signal Amplitude [V]');
title('Measured Signal at Filter Input');
nexttile;
plot(time, signal2);
ylim([-1.2,1.2])
xlabel('Time [s]');
ylabel('Signal Amplitude [V]');
title('Measured Signal at Filter Output');
saveas(figure(7), "1ST_ORDER_ACTIVE_HIGH_PASS_TIME_DOMAIN.svg");

% Perform Fourier Transform on each signal
signal1_fft = fft(signal1); % Normalized FFT of channel 1
signal2_fft = fft(signal2); % Normalized FFT of channel 2
L=length(time);
fs = 1 / (time(2) - time(1));
% sampling frequency
f = fs*(0:(L/2))/L;

P2 = abs(signal1_fft/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
figure(8)
tiledlayout(2,1)
sgtitle("1st Order Active High-Pass Filtering ")
nexttile
stem(f,mag2db(P1))
xlim([0,70000])
xlabel('Frequency [Hz]');
ylabel('Signal Magnitude [dB]');
title('Measured Frequency Spectrum of Input Signal');

P2 = abs(signal2_fft/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
nexttile
stem(f,mag2db(P1))
xlim([0,70000])
xlabel('Frequency [Hz]');
ylabel('Signal Magnitude [dB]');
title('Measured Frequency Spectrum of Output Signal');
saveas(figure(8), "1ST_ORDER_ACTIVE_HIGH_PASS_FFT.svg");



%%RC LOW PASS
% Define file name and read data
filename = 'RC_LOW_PASS_FILTERING_SCOPE.csv';
data = csvread(filename, 1, 0);

% Extract time and signal data for each channel
time = data(:, 1);
signal1 = data(:, 2);
signal2 = data(:, 3);

figure(9);
tiledlayout(2,1);
sgtitle("RC Low-Pass Filtering.")
nexttile;
plot(time, signal1);
ylim([-1.2,1.2])
xlabel('Time [s]');
ylabel('Signal Amplitude [V]');
title('Measured Signal at Filter Input');
nexttile;
plot(time, signal2);
ylim([-1.2,1.2])
xlabel('Time [s]');
ylabel('Signal Amplitude [V]');
title('Measured Signal at Filter Output');
saveas(figure(9), "RC_LOW_PASS_TIME_DOMAIN.svg");

% Perform Fourier Transform on each signal
signal1_fft = fft(signal1); % Normalized FFT of channel 1
signal2_fft = fft(signal2); % Normalized FFT of channel 2
L=length(time);
fs = 1 / (time(2) - time(1));
% sampling frequency
f = fs*(0:(L/2))/L;

P2 = abs(signal1_fft/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
figure(10)
tiledlayout(2,1)
sgtitle("RC Low-Pass Filtering ")
nexttile
stem(f,mag2db(P1))
xlim([0,70000])
xlabel('Frequency [Hz]');
ylabel('Signal Magnitude [dB]');
title('Measured Frequency Spectrum of Input Signal');

P2 = abs(signal2_fft/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
nexttile
stem(f,mag2db(P1))
xlim([0,70000])
xlabel('Frequency [Hz]');
ylabel('Signal Magnitude [dB]');
title('Measured Frequency Spectrum of Output Signal');
saveas(figure(10), "RC_LOW_PASS_FFT.svg");



%%RC HIGH PASS
% Define file name and read data
filename = 'RC_HIGH_PASS_FILTERING_SCOPE.csv';
data = csvread(filename, 1, 0);

% Extract time and signal data for each channel
time = data(:, 1);
signal1 = data(:, 2);
signal2 = data(:, 3);

figure(11);
tiledlayout(2,1);
sgtitle("RC High-Pass Filtering.")
nexttile;
plot(time, signal1);
ylim([-1.2,1.2])
xlabel('Time [s]');
ylabel('Signal Amplitude [V]');
title('Measured Signal at Filter Input');
nexttile;
plot(time, signal2);
ylim([-1.2,1.2])
xlabel('Time [s]');
ylabel('Signal Amplitude [V]');
title('Measured Signal at Filter Output');
saveas(figure(11), "RC_HIGH_PASS_TIME_DOMAIN.svg");

% Perform Fourier Transform on each signal
signal1_fft = fft(signal1); % Normalized FFT of channel 1
signal2_fft = fft(signal2); % Normalized FFT of channel 2
L=length(time);
fs = 1 / (time(2) - time(1));
% sampling frequency
f = fs*(0:(L/2))/L;

P2 = abs(signal1_fft/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
figure(12)
tiledlayout(2,1)
sgtitle("RC High-Pass Filtering ")
nexttile
stem(f,mag2db(P1))
xlim([0,70000])
xlabel('Frequency [Hz]');
ylabel('Signal Magnitude [dB]');
title('Measured Frequency Spectrum of Input Signal');

P2 = abs(signal2_fft/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
nexttile
stem(f,mag2db(P1))
xlim([0,70000])
xlabel('Frequency [Hz]');
ylabel('Signal Magnitude [dB]');
title('Measured Frequency Spectrum of Output Signal');
saveas(figure(12), "RC_HIGH_PASS_FFT.svg");