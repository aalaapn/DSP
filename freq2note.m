function [ noteString, keyNum ] = freq2note( hertz )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
keyNum = round(mod(12*log2(hertz/440)+49,12));
if keyNum == 1
    noteString = 'A';
elseif keyNum == 2
    noteString = 'A#/Bb';
elseif keyNum == 3
    noteString = 'B';
elseif keyNum == 4
    noteString = 'C';
elseif keyNum == 5
    noteString = 'C#/Db';
elseif keyNum == 6
    noteString = 'D';
elseif keyNum == 7
    noteString = 'D#/Eb';
elseif keyNum == 8
    noteString = 'E';
elseif keyNum == 9
    noteString = 'F';
elseif keyNum == 10
    noteString = 'F#/Gb';
elseif keyNum == 11
    noteString = 'G';
elseif keyNum == 0
    noteString = 'G#/Ab';
else
    noteString = 'error';
end