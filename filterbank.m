function out = filterbank(sig, bandlimits, maxfreq)
%function takes in a signal and outputs that signal
%in the frequency domain. 

%set defaults
if nargin <2
    bandlimits = [0 200 400 800 1600 3200];
end

if nargin <3
    maxfreq = 4096;
end

dft = fft(sig);
n = length(dft);
num_bands = length(bandlimits);



for i=1:num_bands-1
    bl(i) = floor(bandlimits(i)/maxfreq*n/2)+1;
    br(i) = floor(bandlimits(i+1)/maxfreq*n/2);
end

bl(num_bands) = floor(bandlimits(num_bands)/maxfreq*n/2)+1;
br(num_bands) = floor(n/2);

out = zeros(n,num_bands);

% Create the frequency bands and put them in the vector output.

for i = 1:num_bands
out(bl(i):br(i),i) = dft(bl(i):br(i));
out(n+1-br(i):n+1-bl(i),i) = dft(n+1-br(i):n+1-bl(i));
end

out(1,1)=0;

end