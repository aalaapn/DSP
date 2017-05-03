function [ score ] = keyScore( histoInd, k, profiles )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    profile = profiles(:,k);
    [~, profIndices] = sort(profile,'descend');
    score = 0;
    for i1 = 1:4
        if any(profIndices(1:4) == histoInd(i1))
            score = score + 0.25;
        end
    end
    if score ~= 1
        for i1 = 5:8
            score = score - 0.1;
            if any(profIndices(1:4) == histoInd(i1))
                score = score + 0.25;
                break;
            end
        end
    end
end

