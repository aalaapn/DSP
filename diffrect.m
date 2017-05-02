function out = diffrect(sig, num_bands)

if nargin <2
    num_bands = 6;
end

n = length(sig);

for i=1:num_bands
    for j=5:n
        d = sig(j,i) - sig(j-1, i);
        if d>0
            out(j,i) = d;
        end
    end
end



end