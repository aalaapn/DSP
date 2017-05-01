[St,Fs] = audioread('skrill.wav');  
L = size(St,1); 
T = 1/Fs;                   
t = (0:L-1)*T;
% Input signal chart S(t)
subplot(2,3,1); 
plot(t,St);grid;                                         
title('Signal S(t)')
xlabel('Time,s')
ylabel('Signal amplitude S(t)')
ylim([-1.5 1.5])
% Fourier transform of the input signal S(t)
% NFFT = 2^nextpow2(L);                              % Next power of 2 from length of L
NFFT=2^16;
Sf = fft(St,NFFT)/NFFT;
f =Fs/2*linspace(0,1,NFFT/2);
Z=2*abs(Sf(1:NFFT/2));
% Input signal spectrum chart Sf(f)
subplot(2,3,2);
plot(f(1:NFFT/2),20*log10(Z(1:NFFT/2)));grid;        
title('Signal spectrum S(t)')
xlabel('Frequency (Hz)')
ylabel('Signal magnitude |Sf(f)|, dB')
% Band filter
[b,a]=ellip(4,0.001,30,[50 500]*2/Fs);
[H,w]=freqz(b,a,NFFT);
subplot(2,3,3);
plot(w(1:NFFT)*Fs/(2*pi),abs(H(1:NFFT)));grid;                      % Frequency response of the filter
title('Frequency response')
xlabel('Frequency (Hz)')
ylabel('Response factor')
SL=filter(b,a,St);
% Output signal chart SL(t)
subplot(2,3,4);
plot(t,SL);grid;                                            
title('Signal SL(t)')
xlabel('Time,s')
ylabel('Signal amplitude SL(t)')
ylim([-1.5 1.5])
% Fourier transform of the output signal (after a filtering)
SLf = fft(SL,NFFT)/NFFT;
% ff =Fs/2*linspace(0,1,NFFT/2);
ZZ=2*abs(SLf(1:NFFT/2));
% Output (filtered) signal spectrum chart SLf(f)
subplot(2,3,5);
plot(f(1:NFFT/2),20*log10(ZZ(1:NFFT/2)));grid;        
title('Signal spectrum SL(t)')
xlabel('Frequency (Hz)')
ylabel('Signal magnitude |SLf(f)|, dB')
% Write to disk
audiowrite('output.wav', SL,Fs);
