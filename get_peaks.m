function out = get_peaks(acfs)
	s = size(acfs);
	out = [];
	s(2)
	for i = 1:s(2)
		[val, locs] = findpeaks(acfs(:,i));
		out = cat(1, out, locs);
	end
end