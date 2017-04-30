% [y,fs] = audioread('seven.wav');
% L = length(y);
% fft_y = fft(y);
% p2 = (abs(fft_y/L));
% p1 = p2(1:L/2+1);
% p1(2:end-1) = 2*p1(2:end-1);
% 
% f = fs*(0:(L/2))/L;
% %plot(f, p1)
% %xlim([0 30]);
% y = y(:,1);
% nwin = 63;
% wind = kaiser(nwin,17);
% nlap = nwin-10;
% nfft = 256;

%spectrogram(y,wind,nlap,nfft,fs,'yaxis')

function [y, L, fs] = read_data(song)
    [y,fs] = audioread(song);
    y = y(:,1);
    L = length(y);

end
