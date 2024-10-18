clc
close all;
clear all;


disp('LPF FILTER');
wp=0.2*pi;
ws=0.4*pi;
ap=0.6;
as=30;
[N,wc]=cheb1ord(wp,ws,ap,as,'s');
disp('Order of the filter: ');
disp(N);
disp('Cut off frequency: ');
disp(wc);
[Nr,Dr]=cheby1(N,ap,wc,'low');
w=0:0.01:pi;
[H,f]=freqz(Nr,Dr,w);
subplot(2,2,1);
plot(f,abs(H));
xlabel('frequency');
ylabel('magnitude');
title('Magnitude Response of LPF');


disp('HPF FILTER');
wp=0.2*pi;
ws=0.4*pi;
ap=0.6;
as=30;
[N,wc]=cheb1ord(wp,ws,ap,as,'s');
disp('Order of the filter: ');
disp(N);
disp('Cut off frequency: ');
disp(wc);
[Nr,Dr]=cheby1(N,ap,wc,'high');
w=0:0.01:pi;
[H,f]=freqz(Nr,Dr,w);
subplot(2,2,2);
plot(f,abs(H));
xlabel('frequency');
ylabel('magnitude');
title('Magnitude Response of HPF');



disp('BPF FILTER');
wp=[0.1*pi 0.3*pi];
ws=[0.05*pi 0.35*pi];
ap=0.6;
as=30;
[N,wc]=cheb1ord(wp,ws,ap,as,'s');
disp('Order of the filter: ');
disp(N);
disp('Cut off frequency: ');
disp(wc);
[Nr,Dr]=cheby1(N,ap,wc,'bandpass');
w=0:0.01:pi;
[H,f]=freqz(Nr,Dr,w);
subplot(2,2,3);
plot(f/pi,abs(H));
xlabel('frequency');
ylabel('magnitude');
title('Magnitude Response of BPF');


disp('BSF / BRF / BEF FILTER');
wp=[0.05*pi 0.25*pi];
ws=[0.1*pi 0.2*pi];
ap=0.6;
as=30;
[N,wc]=cheb1ord(wp,ws,ap,as,'s');
disp('Order of the filter: ');
disp(N);
disp('Cut off frequency: ');
disp(wc);
[Nr,Dr]=cheby1(N,ap,wc,'stop');
w=0:0.01:pi;
[H,f]=freqz(Nr,Dr,w);
subplot(2,2,4);
plot(f/pi,abs(H));
xlabel('frequency');
ylabel('magnitude');
title('Magnitude Response of BSF');
