function low_data  = low_pass(data, fs)
    [y,fs] = audioread(song);
    y = y(:,1);
    
    % Fourier transform of the input signal S(t)
    % NFFT = 2^nextpow2(L);                              % Next power of 2 from length of L
    NFFT=2^16;
    Sf = fft(St,NFFT)/NFFT;
    f =Fs/2*linspace(0,1,NFFT/2);
    Z=2*abs(Sf(1:NFFT/2));
    
    % Band filter
    [b,a]=ellip(4,0.001,30,[50 500]*2/Fs);
    [H,w]=freqz(b,a,NFFT);




end