[low, fs] = low_pass('ode.wav');
song_len = (size(low)/fs);
down_low = downsample(low, 10);
%audiowrite('output.wav', down_low, fs/1000);
% plot(down_low);
% figure
% plot(low);

shft_amt = zeros(10,1);
down_low = down_low(:,1);
low = low(:,1);


nwin = 63;
wind = kaiser(nwin, 17);
nlap = nwin-10;
nfft = 256;

spectrogram(low,wind,nlap,nfft,fs,'yaxis')
figure
spectrogram(down_low,wind,nlap,nfft,fs,'yaxis')
