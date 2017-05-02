clear;
histogram = zeros(12,1);  % indexed by note num
[dataA,fsA] = audioread('test-tones/A440hz.wav');
[dataC,fsC] = audioread('test-tones/C523hz.wav');
[dataE,fsE] = audioread('test-tones/E659hz.wav');

data = dataA + dataC + dataE;
fs = fsA;

% chop into snippets of 20ms
dur = 0.02;             % duration of snippet in sec
durLen = dur*fs;  % duration in indices
snippets = data(1:min(durLen, length(data)));
pos = durLen+1;
while pos < length(data)
    temp = padarray(data(pos:min(pos+durLen-1, length(data))),[max(0, pos+durLen-1 - length(data))],'post');
    snippets = horzcat(snippets,temp);
    pos = pos + durLen + 1;
end
sampNum = size(snippets);
sampNum = sampNum(2);
for in = 1:sampNum
    p2 = abs(fft(snippets(:,in))/durLen);
    p1 = p2(1:durLen/2+1);
    p1(2:end-1) = 2*p1(2:end-1);
    [pks,locs] = findpeaks(padarray(p1,[1,0]));
    locs = locs - 1;
    % temp code: just find 1 peak
    maxPkLoc = locs(find(pks == max(pks)));
    freq = fs*(maxPkLoc-1)/durLen;
    [noteStr, keyNum] = freq2note(freq);
    if keyNum == 0
        keyNum = 12;
    end
    histogram(keyNum) = histogram(keyNum) + 1;
end