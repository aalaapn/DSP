function [ key ] = keyGuess( histoIndices, profiles )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    % checking algorithm
    key = -1; % initial "invalid" state
    scores = zeros(12,1);
    % first check max note's key
    note = histoIndices(1);
    scores(note) = perfectMatch(histoIndices, note, profiles);
    scores(note) = scores(note) + keyScore(histoIndices, note, profiles);

    % then check all keys where max note is weight 2
    indexSet = find(profiles(note,:) == 2);
    for i2 = 1:length(indexSet)
        k = indexSet(i2);
        scores(k) = perfectMatch(histoIndices, k, profiles);
        scores(k) = scores(k) + keyScore(histoIndices, k, profiles); 
    end
    % then check all keys where max note is weight 1
    indexSet = find(profiles(note,:) == 1);
    for i2 = 1:length(indexSet)
        scores(k) = perfectMatch(histoIndices, k, profiles);
        scores(k) = scores(k) + keyScore(histoIndices, k, profiles); 
    end

    % take the "best" one
    key = find(scores == max(scores));

end

