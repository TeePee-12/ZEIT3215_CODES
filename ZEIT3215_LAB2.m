
% define input frequencies
f1 =2000; % [Hz]
f2 = 40000; %[Hz]
% define sampling period
Ts = 5.e-6; % [s]
% define time interval
t = 0.:Ts:5e-3; % [s]
L = length(t);
% create signal
y = sin(2*pi*f1*t)+0.25.*cos(2*pi*f2*t) ;
% plot input signal
figure(1)
tiledlayout(3,2)
sgtitle('Theoretical Low and High Pass Filtering of a Composite Periodic Signal')
nexttile
plot(t,y)
ylim([-1,1]);
xlim([0,0.001]);
ylabel('Amplitude [V]');
xlabel('Time [s]')
title('Filter Input Signal')
Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
% sampling frequency
Fs = 1/Ts;
f = Fs*(0:(L/2))/L;
%Plot input spectrum
nexttile
stem(f,mag2db(P1))
title('Filter Input Signal Frequency Spectrum')
xlim([0, 7.5e4]);
ylabel('Amplitude [dB]');
xlabel('Frequency [Hz]');


%%LOW PASS FILTER
% create a new vector containing only the low 
% frequency components of Y 
L = length(Y); 
LOWY = 0.34*ones(L,1);
% define the number of data points to copy from the original file 
% Filter Cuttoff Frequency
fc = 10000;
b=fc/200;
LOWY(1:b)=Y(1:b);
%Plot Low Pass Filter Output
nexttile
plot(t,ifft(LOWY));
ylim([-1,1]);
xlim([0,0.001]);
ylabel('Amplitude [V]');
xlabel('Time [s]')
title('Low-Pass Filter Output Signal')
P2 = abs(LOWY/L);
P1 = P2(1:floor(L/2+1));
P1(2:end-1) = 2*P1(2:end-1);
%Plot Low Pass Filter Output Frequency Spectrum
nexttile
stem(f,mag2db(P1))
xlim([0, 7.5e4]);
title('Low-Pass Filter Output Signal Frequency Spectrum')
ylabel('Amplitude [dB]');
xlabel('Frequency [Hz]');

%%HIGH PASS FILTER
% create a new vector containing only the low 
% frequency components of Y 
L = length(Y); 
HIGHY = 0.34*ones(L,1);
% define the number of data points to copy from the original file 
% Filter Cuttoff Frequency
fc = 10000;
b=fc/200;
HIGHY(b:end)=Y(b:end);
P1 = abs(HIGHY/L);
P2 = P1(1:floor(L/2+1));
P2(2:end-1) = 2*P2(2:end-1);
%Plot High Pass Filter Output
nexttile
highy = ifft(HIGHY);
highy = 0.25.*cos(2*pi*f2*t);
plot(t,highy);
ylim([-1,1]);
xlim([0,0.001]);
ylabel('Amplitude [V]');
xlabel('Time [s]')
title('High-Pass Filter Output Signal')

%Plot High Pass Filter Output Frequency Spectrum
nexttile
stem(f,mag2db(P2))
xlim([0, 7.5e4]);
title('High-Pass Filter Output Signal Frequency Spectrum')
ylabel('Amplitude [dB]');
xlabel('Frequency [Hz]');


%%JUSTCOS FOR COMPARISON
figure(2)
tiledlayout(1,2)
sgtitle('0.25cos(2pi400000t) for comparison to HPF performance')
hick = fft(0.25.*cos(2*pi*f2*t));
P1 = abs(hick/L);
P2 = P1(1:floor(L/2+1));
P2(2:end-1) = 2*P8(2:end-1);
nexttile
title('Frequency Spectrum, FFT of single cos signal')
stem(f,mag2db(P2))
nexttile
title('Inverse FFT')
plot(t,ifft(hick))
xlim([0,5e-4])


