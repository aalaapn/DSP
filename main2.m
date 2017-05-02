tic
bandlimits = [];
for i=1:50
    band = i*100;
    bandlimits = [bandlimits band];
end
[sig, fs] = audioread('songs/ode.wav');
sig = sig(:,1);
out = filterbank(sig);

hann = hannWindow(out);

diff = diffrect(hann);


down_low = downsample(diff, 100);

% auto_cor = autocorr(down_low);

[ACF,lags,bounds] = autocorr(down_low(:,1),int64(fs/100),[],2);





[~,locs]=findpeaks(ACF);
lagindex = mean(diff(locs)*0.01);

((fs/10000)*60)/lagindex;

a = [];
for i = 100:400
    a = [a ACF(i)];
end

maxi = max(a);

ind = find(ACF==maxi)

BPM = fs/100*60/ind
ind = fs/100*60/82
toc
% audiowrite('filterbank_out/out1.wav',hann(:,1), fs)
% audiowrite('filterbank_out/out2.wav',hann(:,2), fs)
% audiowrite('filterbank_out/out3.wav',hann(:,3), fs)
% audiowrite('filterbank_out/out4.wav',hann(:,4), fs)
% audiowrite('filterbank_out/out5.wav',hann(:,5), fs)
% audiowrite('filterbank_out/out6.wav',hann(:,6), fs)


