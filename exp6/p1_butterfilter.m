
close all;
clear all;

% Butterworth analog low pass filter
disp('LPF FILTER');
wp=20;
ws=30;
ap=2;
as=10;
[N,wc]=buttord(wp,ws,ap,as,'s');
disp('Order of the filter: ');
disp(N);
disp('Cut off frequency: ');
disp(wc);
[Nr,Dr]=butter(N,wc,'s');
[H,f]=freqs(Nr,Dr);
subplot(2,2,1);
plot(f,abs(H));
xlabel('frequency (rad/s)');
ylabel('magnitude');
title('Magnitude Response of LPF');

% Butterworth analog high pass filter
disp('HPF FILTER');
wp=20;
ws=30;
ap=2;
as=10;
[N,wc]=buttord(wp,ws,ap,as,'s');
disp('Order of the filter: ');
disp(N);
disp('Cut off frequency: ');
disp(wc);
[Nr,Dr]=butter(N,wc,'high','s');
[H,f]=freqs(Nr,Dr);
subplot(2,2,2);
plot(f,abs(H));
xlabel('frequency (rad/s)');
ylabel('magnitude');
title('Magnitude Response of HPF');

% Butterworth analog band pass filter
disp('BPF FILTER');
wp=[100 200];
ws=[50 250];
ap=2;
as=30;
[N,wc]=buttord(wp,ws,ap,as,'s');
disp('Order of the filter: ');
disp(N);
disp('Cut off frequency: ');
disp(wc);
[Nr,Dr]=butter(N,wc,'bandpass','s');
[H,f]=freqs(Nr,Dr);
subplot(2,2,3);
plot(f,abs(H));
xlabel('frequency (rad/s)');
ylabel('magnitude');
title('Magnitude Response of BPF');

% Butterworth analog bandstop filter
disp('BSF / BRF / BEF FILTER');
wp=[50 250];
ws=[100 200];
ap=2;
as=30;
[N,wc]=buttord(wp,ws,ap,as,'s');
disp('Order of the filter: ');
disp(N);
disp('Cut off frequency: ');
disp(wc);
[Nr,Dr]=butter(N,wc,'stop','s');
[H,f]=freqs(Nr,Dr);
subplot(2,2,4);
plot(f,abs(H));
xlabel('frequency (rad/s)');
ylabel('magnitude');
title('Magnitude Response of BSF');
