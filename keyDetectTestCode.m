clear;
[data, sampRate] = audioread('test-tones/A440hz.wav');
% chop into snippets of 20ms
dur = 0.02;             % duration of snippet in sec
durLen = dur*sampRate;  % duration in indices
snippets = data(1:min(durLen, length(data)));
pos = durLen+1;
while pos < length(data)
    temp = padarray(data(pos:min(pos+durLen-1, length(data))),[max(0, pos+durLen-1 - length(data))],'post');
    snippets = horzcat(snippets,temp);
    pos = pos + durLen + 1;
end

for 