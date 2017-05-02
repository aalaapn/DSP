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

n = length(sig);
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

% Full-wave rectification in the time domain.
    %A full-wave bridge rectifier converts the whole of the 
    %input waveform to one of constant polarity 
    %(positive or negative) at its output
    
    %esentially turning any negative values to positive values
% And back to frequency with FFT.
for i=1:num_bands
    for j=1:n
        if wave(j,i)<0
            wave(j,i) = -wave(j,i);
        end
    end
    freq(:,i) = fft(wave(:,i));
end

%Convolving with half-Hanning same as multiplying in
% frequency. Multiply half-Hanning FFT by signal FFT. Inverse
% transform to get output in the time domain.

for i = 1:num_bands
    filtered(:,i) = freq(:,i).*fft(hann);
    out(:,i) = real(ifft(filtered(:,i)));
end

 
end