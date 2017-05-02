function out = hannWindow(sig, window_length, bandlimits, maxfreq)

%set defaults
if nargin < 2
    window_length = .4; 
end  

if nargin < 3
    bandlimits = [0 200 400 800 1600 3200]; 
end

if nargin < 4
    maxfreq = 4096;
end

n = length(sig)
num_bands = length(bandlimits);

hannlen = (window_length*2*maxfreq);

hann = zeros(n, 1);

for a = 1:hannlen
    hann(a) = (cos(a*pi/hannlen/2)).^2;
end

%convert to time domain
wave = sig;
for i=1:num_bands
    wave(:,i) = real(ifft(sig(:,i)));
end

out = wave;


end