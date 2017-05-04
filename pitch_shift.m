function audio_shifted = pitch_shift(audio, amt)
%Shift audio in pitch by amt times
% L = length(DFT);
% samp(1:round(amt):round(amt*L),:) = DFT(1:L,:);
% fnew = sr/L*(0:length(samp)-1);

[rows, cols] = size(audio);

%Size of FFT
fftpoints = 1024;
hop = fftpoints/4;
%Hann window
window = .5*(1-cos(2*pi*(1:fftpoints)/fftpoints));

for col = 1:cols
    index = 1;
    stft = zeros(1+fftpoints/2,ceil(2*(rows-fftpoints)/fftpoints));
    %Do FFT on overlapping chunks
    for a = 0:hop:rows-fftpoints
        chunk_windowed = window' .* audio((a+1):(a+fftpoints), col);
        chunk_fft = fft(chunk_windowed);
        stft(:,index) = chunk_fft(1:(1+fftpoints/2))';
        index = index + 1;
    end
    
    %Get new scaled timesteps - interpolate between ffts based on
    %how close time is to each original timestep (eg .1 means 90% of prev
    %fft and 10% of next. Use phase advance to calculate phase of fft.
    t = 0:amt:(index-3);
    newsize = ceil((index-3)/amt);
    phase = angle(stft(:,1));
    index = 1;
    new = zeros(1+fftpoints/2, newsize);
    
    %Columbia
%     dphi = zeros(1, 1+fftpoints/2);
%     dphi(2:(1+fftpoints/2)) = (2*pi*hop) ./ (rows./(1:(fftpoints/2)));
    
    for time = t
        stft1 = stft(:,1+floor(time));
        stft2 = stft(:,2+floor(time));
        new_mag = (time-floor(time))*abs(stft1) + (1-(time-floor(time)))*abs(stft2);
        
        %Columbia
%         dp = angle(stft2)-angle(stft1);
%         dp = dp - 2*pi*round(dp/(2*pi));
%         new(:, index) = new_mag .* exp(j*phase);
%         phase = phase + dphi' + dp;
        
        new(:, index) = new_mag .* exp(j*phase);
        phase = mod(phase + (angle(stft2)-angle(stft1)),2*pi);
        index = index + 1;
    end
    
    %Perform inverse short time Fourier transform
    audio_shifted(:, col) = zeros(fftpoints+(fftpoints/2*(newsize-1)),1);
    for b = 0:hop:(hop*(newsize-1))
        half = new(:,1+b/hop);
        whole = [half; conj(half((fftpoints/2):-1:2))];
        part = real(ifft(whole));
        audio_shifted((b+1):(b+fftpoints), col) = audio_shifted((b+1):(b+fftpoints), col)+2/3*part.*window';
    end
end

[n,d] = rat(amt);
audio_shifted = resample(audio_shifted, n, d);