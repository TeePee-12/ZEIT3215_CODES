%% Sinusoidal wave
% define pass-band frequency
f1 = 1000; % [Hz]
% define sampling period
Ts = 5.e-6; % [s]
% define time interval
t = 0.:Ts:5e-3; % [s]
L = length(t);
% create signal
y = sin(2*pi*f1*t);
% plot signal
figure(1)
tiledlayout(2,2)
sgtitle('2V P-P 1kHz Pure Sinusoidal Signal') 
nexttile([2 1])
plot(t,y)
title("Time Domain")
xlabel("t [ms]")
ylabel("y[t]")

% calculate FFT of the signal
Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
% sampling frequency
Fs = 1/Ts;
f = Fs*(0:(L/2))/L;
nexttile
stem(f,mag2db(P1)) 
ylim([-100.0, 10])
xlim([-100,5100])
title("Single-Sided Amplitude Spectrum")
xlabel("f [Hz]")
ylabel("Magnitude [dB]")

% calculate power spectrum in dBm
R = 1000000; % [Ohm] - the impedance of the voltage sensor
PdBm = 10*log10((P1/8.*50)/.001); % [dBm] - the power in dBm

% plot power spectrum in dBm
nexttile
stem(f,PdBm) 
ylim([-10, 45])
xlim([-100,5100])
title("Single-Sided Power Spectrum")
xlabel("f [Hz]")
ylabel("Power [dBm]")


%% Square wave
% define pass-band frequency
f1 = 1000; % [Hz]
% define sampling period
Ts = 5.e-6; % [s]
% define time interval
t = 0.:Ts:5e-3; % [s]
L = length(t);
% create signal
y = square(2*pi*f1*t);
% plot signal
figure(2)
tiledlayout(2,2)
sgtitle('2V P-P 1kHz Square Signal') 
nexttile([2 1])
plot(t,y)
ylim([-1.1,1.1])
title("Time Domain)")
xlabel("t [ms]")
ylabel("y[t]")

% calculate FFT of the signal
Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
% sampling frequency
Fs = 1/Ts;
f = Fs*(0:(L/2))/L;
nexttile
stem(f,mag2db(P1)) 
ylim([-100.0, 10])
xlim([-100,5100])
title("Single-Sided Amplitude Spectrum")
xlabel("f [Hz]")
ylabel("Magnitude [dB]")

% calculate power spectrum in dBm
R = 1000000; % [Ohm] - the impedance of the voltage sensor
PdBm = 10*log10((P1/8.*50)/.001); % [dBm] - the power in dBm

% plot power spectrum in dBm
nexttile
f0_idx = find(f == 0);
% plot only the positive frequencies and their corresponding powers
stem(f,PdBm) 
ylim([-10, 40])
xlim([-100,5100])
title("Single-Sided Power Spectrum")
xlabel("f [Hz]")
ylabel("Power [dBm]")

%% Triangle wave
% define pass-band frequency
f1 = 1000; % [Hz]
% define sampling period
Ts = 5.e-6; % [s]
% define time interval
t = 0.:Ts:5e-3; % [s]
L = length(t);
% create signal
y =  sawtooth(2*pi*f1*t,1/2);
% plot signal
figure(3)
tiledlayout(2,2)
sgtitle('2V P-P 1kHz Triangle Signal') 
nexttile([2 1])
plot(t,y)
ylim([-1.1,1.1])
title("Time Domain")
xlabel("t [ms]")
ylabel("y[t]")

% calculate FFT of the signal
Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
% sampling frequency
Fs = 1/Ts;
f = Fs*(0:(L/2))/L;
nexttile
stem(f,mag2db(P1)) 
ylim([-120.0, 10])
xlim([-100,5100])
title("Single-Sided Amplitude Spectrum")
xlabel("f [Hz]")
ylabel("Magnitude [dB]")

% calculate power spectrum in dBm
R = 1000000; % [Ohm] - the impedance of the voltage sensor
PdBm = 10*log10((P1/8.*50)/.001); % [dBm] - the power in dBm

% plot power spectrum in dBm
nexttile
stem(f,PdBm) 
ylim([-35, 40])
xlim([-100,5100])
title("Single-Sided Power Spectrum")
xlabel("f [Hz]")
ylabel("Power [dBm]")
