function [ histo, data, fs ] = noteHisto( fileName )
%noteHisto returns histogram of notes detected
%   Detailed explanation goes here
    histo = zeros(12,1);  % indexed by note num
    % [dataA,fsA] = audioread('test-tones/A440hz.wav');
    % [dataC,fsC] = audioread('test-tones/C523hz.wav');
    % [dataE,fsE] = audioread('test-tones/E659hz.wav');
    % 
    % data = dataA + dataC + dataE;
    % fs = fsA;
    [data,fs] = audioread(fileName);

    channels = size(data);
    channels = channels(2);
    % chop into snippets
    dur = 0.5;             % duration of snippet in sec
    durLen = dur*fs;  % duration in indices
    snippets = data(1:min(durLen, length(data)),:);
    pos = durLen+1;
    while pos < length(data)
        temp = padarray(data(pos:min(pos+durLen-1, length(data)),:),[max(0, pos+durLen-1 - length(data))],'post');
        snippets = horzcat(snippets,temp);
        pos = pos + durLen + 1;
    end
    sampNum = size(snippets);
    sampNum = sampNum(2);
    for in = 1:sampNum
        p2 = abs(fft(snippets(:,in))/durLen);
        p1 = p2(1:durLen/2+1,:);
        p1(2:end-1,:) = 2*p1(2:end-1,:);
        [pks,locs] = findpeaks(p1);
        locs = locs - 1;
        thold = max(pks)/2;
        for i2 = 1:length(pks)
            if pks(i2) >= thold
                freq = fs*locs(i2)/durLen;
                [noteStr, keyNum] = freq2note(freq);
                if keyNum == 0
                    keyNum = 12;
                end
                histo(keyNum) = histo(keyNum) + 1;
            end
        end
    end
end

