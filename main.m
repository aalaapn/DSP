[low, fs] = low_pass('skrill.wav');
song_len = (size(low)/fs);
down_low = downsample(low, 100);
%audiowrite('output.wav', down_low, fs/1000);
% plot(down_low);
% figure
% plot(low);

shft_amt = zeros(10,1);
down_low = down_low(:,1);
shift_down_low = cat(1, shft_amt, down_low);

cross_cor = xcorr(down_low, shift_down_low);
% auto_cor = autocorr(down_low);
[ACF,lags,bounds] = autocorr(down_low,int64(fs/100),[],2);

int64(fs/100)
plot(ACF)

[~,locs]=findpeaks(ACF);
lagindex = mean(diff(locs)*0.01);

((fs/10000)*60)/lagindex;

a = [];
for i = 100:size(ACF)
    append(a, ACF(i));
end
plot(a)


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
