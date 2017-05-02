bandlimits = [];
for i=1:50
    band = i*100;
    bandlimits = [bandlimits band];
end
[sig, fs] = audioread('songs/skrill.wav');
sig = sig(:,1);
out = filterbank(sig);

hann = hannWindow(out);

audiowrite('filterbank_out/out1.wav',hann(:,1), fs)
audiowrite('filterbank_out/out2.wav',hann(:,2), fs)
audiowrite('filterbank_out/out3.wav',hann(:,3), fs)
audiowrite('filterbank_out/out4.wav',hann(:,4), fs)
audiowrite('filterbank_out/out5.wav',hann(:,5), fs)
audiowrite('filterbank_out/out6.wav',hann(:,6), fs)

