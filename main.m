[low, fs] = low_pass('skrill.wav');
song_len = (size(low)/fs)
down_low = downsample(low, 10)
spectrogram(low(:,1), 10)

% [autocorr, lags] = xcorr(low, fs*10);
% 
% 
% 
% [pks,loc] = findpeaks(autocorr(:,1));
% 
% 
% short = mean(diff(loc))/fs
% [pklg,lclg] = findpeaks(autocorr(:,1), ...
%     'MinPeakDistance',ceil(short)*fs,'MinPeakheight',0.3);
% long = mean(diff(lclg))/fs
