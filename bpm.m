function bpm_out = bpm(song, enable_graphs)
%function calculates the bpm of 'song'
tic
if nargin < 2
	enable_graphs = 0;
end 

[sig, fs] = audioread(song);
sig = sig(:,1);

x = 1:length(sig(:,1));

%create filter bank and plot
out = filterbank(sig);

if(enable_graphs)
	multi_plot(out, x, 1, length(x));
	figure
end

%create hann_window and plot
hann_out = hannWindow(out);

if(enable_graphs)
	multi_plot(hann_out, x, 1, length(x));
	figure
end

%downsample signal
down_low = downsample(hann_out, 100);

% // if(enable_graphs)
% // 	multi_plot(down_low, x, 1, length(x));
% // 	figure
% // end


%compute autocorrelation of each bank
acfs = ACF_calc(down_low, 10, int64(fs/100));
a = acfs(:,1);

%convert lags to BPM
BPM_ACF = BPM_convert(a, fs/100);

if(enable_graphs)
	multi_plot(acfs, BPM_ACF, 40, 300);
end

peak = get_peaks(acfs, fs/100);

bpm_out = peak;

toc

end