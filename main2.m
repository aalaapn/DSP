tic
bandlimits = [];
for i=1:50
    band = i*100;
    bandlimits = [bandlimits band];
end

[sig, fs] = audioread('songs/skrill.wav');
sig = sig(:,1);

%create filter bank
out = filterbank(sig);
%create hann_window
hann_out = hannWindow(out);
%downsample signal
down_low = downsample(hann_out, 100);


acfs = ACF_calc(down_low, 6, int64(fs/100));
a = acfs(:,1);
BPM_ACF = BPM_convert(a, fs/100);

multi_plot(acfs, BPM_ACF, 40, 300);


[~,locs]=findpeaks(ACF3);
locs
lagindex = mean(diff(locs)*0.01);

((fs/10000)*60)/lagindex;

a = [];
for i = 100:400
    a = [a ACF(i)];
end

maxi = max(a);

ind = find(ACF==maxi);

BPM = fs/100*60/locs;
ind = fs/100*60/82
toc
% audiowrite('filterbank_out/out1.wav',hann(:,1), fs)
% audiowrite('filterbank_out/out2.wav',hann(:,2), fs)
% audiowrite('filterbank_out/out3.wav',hann(:,3), fs)
% audiowrite('filterbank_out/out4.wav',hann(:,4), fs)
% audiowrite('filterbank_out/out5.wav',hann(:,5), fs)
% audiowrite('filterbank_out/out6.wav',hann(:,6), fs)


