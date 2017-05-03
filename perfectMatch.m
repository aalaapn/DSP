function [ match ] = perfectMatch( histoInd, k, profiles )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    profile = profiles(:,k);
    [~, profIndices] = sort(profile,'descend');
    match = 1;
    for i1 = 0:4
        if any(profIndices(1:7) == histoInd(end - i1))
            match = 0;
            break;
        end
    end
end

