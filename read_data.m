% [y,fs] = audioread('seven.wav');
% L = length(y);
function [y, fs] = read_data(song)
    [y,fs] = audioread(song);
    y = y(:,1);
    
end
