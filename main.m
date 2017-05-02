tic
[low, fs] = audioread('120.mp3');
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


plot(ACF)

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
ind = fs/100*60/120

% fs1 = fs/100;
% [s1,f,t,p1]=spectrogram(down_low,hann(8192));
% plot(p1)
% % sf1=10*log10(geomean(p1)./mean(p1)); % spectral flatness
% % plot(linspace(0,length(down_low)/fs1,length(sf1)),sf1); axis tight
% 
% pxx = periodogram(a);
% %figure(2)
% %plot(pxx)
% num=geomean(pxx);
% den=mean(pxx);
% spf=num/den ;
toc