[y,fs] = audioread('test-tones/20000hz.wav');
L = length(y);
fft_y = fft(y);
p2 = (abs(fft_y/L));
p1 = p2(1:L/2+1);
p1(2:end-1) = 2*p1(2:end-1);

f = fs*(0:(L/2))/L;
plot(f, p1)
