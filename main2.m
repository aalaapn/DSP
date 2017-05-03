tic
bandlimits = [];
for i=1:50
    band = i*100;
    bandlimits = [bandlimits band];
end

[sig, fs] = audioread('songs/love.wav');
sig = sig(:,1);

x = 1:length(sig(:,1));

%create filter bank and plot
out = filterbank(sig);

% multi_plot(out, x, 1, length(x));

%create hann_window and plot
hann_out = hannWindow(out);
% multi_plot(hann_out, x, 1, length(x));
% figure

%downsample signal
down_low = downsample(hann_out, 100);
% multi_plot(down_low, x, 1, length(x));

%compute autocorrelation of each bank
acfs = ACF_calc(down_low, 10, int64(fs/100));
a = acfs(:,1);

%convert lags to BPM
BPM_ACF = BPM_convert(a, fs/100);

%multi_plot(acfs, BPM_ACF, 40, 300);

peak = get_peaks(acfs, fs/100);
peak
%peuk = sort(peak);
%x_peak = 1:length(peak);
%scatter(x_peak, peak);

toc
% audiowrite('filterbank_out/out1.wav',hann(:,1), fs)
% audiowrite('filterbank_out/out2.wav',hann(:,2), fs)
% audiowrite('filterbank_out/out3.wav',hann(:,3), fs)
% audiowrite('filterbank_out/out4.wav',hann(:,4), fs)
% audiowrite('filterbank_out/out5.wav',hann(:,5), fs)
% audiowrite('filterbank_out/out6.wav',hann(:,6), fs)


